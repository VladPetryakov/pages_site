# Class describes pages controller
class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update create]

  # GET /
  def index
    @tree = Page.all
    @tree = form_tree_string(nil, @tree, 0, 0)
  end

  # GET /:url
  def show
    render404 and return unless @page

    @subtree = Page.where('path @> ARRAY[?]::varchar[]', @page.path).where.not(id: @page.id)
    @subtree = form_tree_string(@page, @subtree)
  end

  # GET /:url/edit
  def edit; end

  # GET /:url/add
  def add; end

  # PUT /:url/edit
  def update
    @page.update!(permitted_params)
    redirect_to controller: 'pages', action: 'show'
  end

  # POST /:url/add
  def create
    parent_id = @page&.id
    @page = Page.new(parent_id: parent_id)
    @page.update!(params.permit(:name, :title, :text))
    @page.update!(path: names_from_params + [@page.name])
    redirect_to params[:url] ? "/#{params[:url]}/#{@page.name}" : "/#{@page.name}"
  end

  private

  # Returns page by page path
  def get_page_by_names(path)
    Page.find_by(path: path)
  end

  # Sets current page
  def set_page
    names = names_from_params
    @page = get_page_by_names(names)
  end

  # Returns page names from url
  def names_from_params
    params[:url] ? params[:url].split('/') : []
  end

  # Returns html-string with page tree
  # root - tree root page
  # pages for rendering tree
  # start - page number in the list 'pages' from which to form the tree
  # deep - current tree deep
  def form_tree_string(root, pages, start = 0, deep = 0)
    tree_string = '<ul>'
    pages[start..-1].each_with_index do |page, index|
      if !root
        tree_string += "<li>#{page.name}</li>\n#{form_tree_string(page, pages, index, deep + 1)}" unless page.parent_id
      elsif root.id == page.parent_id
        tree_string += "<li>#{page.name}</li>\n#{form_tree_string(page, pages, index, deep + 1)}"
      end
    end
    "#{tree_string}</ul>"
  end

  # Renders not found page
  def render404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  # Filters page params
  def permitted_params
    params.require(:page).permit(:title, :text)
  end
end
