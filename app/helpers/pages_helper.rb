# Helper for rendering page
module PagesHelper
  # Transforms the text with transformations: '*[string]*','\\[string]\\', '((path [string]))' to html tags
  def format(text)
    text = fix_html_intersection(fix_transformation_intersection(text))
    text = transform_link(transform_italics(transform_bold(text)))
    text = remove_extra_tags(text)
  end

  # Transforms the text with '*[string]*' to '<b>[string]</b>'
  def transform_bold(text)
    text.gsub('*').with_index { |_value, index| index.even? ? '<b>' : '</b>' }
  end

  # Transforms the text with '\\[string]\\' to '<i>[string]</i>'
  def transform_italics(text)
    text.gsub('\\\\').with_index { |_value, index| index.even? ? '<i>' : '</i>' }
  end

  # Transforms the text with '((path [string]))' to '<a href="path">[string]</a>'
  def transform_link(text)
    text.gsub(/\(\((.*?)\)\)/).each do |value|
      "<a href=\"\/#{value.split.first[2..-1]}\">#{value.split(' ', 2).last[0..-3]}</a>"
    end
  end

  # Fix intersections transformations with html
  # Example: transforms '* string <i> string * string </i>' to '* string **\\\\<i>**\\\\ string * string **\\\\</i>**\\\\'
  def fix_html_intersection(text)
    text.gsub(%r{(<(.*?[a-zA-Z]+.*?)>)|(</[a-zA-Z]+>)}).each do |value|
      "**\\\\\\\\#{value}**\\\\\\\\"
    end
  end

  # Fix intersections of transformations with another ones
  # Example: transforms '* string \\ string * string \\' to '**\\\\***\\\\ string **\\\\\\**\\\\ string **\\\\***\\\\ string **\\\\\\**\\\\'
  def fix_transformation_intersection(text)
    text = text.gsub(/(\*)|(\\\\)|(\(\()|(\)\))/).each { |value| "**\\\\\\\\#{value}**\\\\\\\\" }
  end

  # Returns text without extra tags
  def remove_extra_tags(text)
    text.gsub(%r{(<b></b>)|(<i></i>)}, '')
  end
end
