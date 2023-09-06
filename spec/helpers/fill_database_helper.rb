module FillDataBaseHelper
  # checks that a track has specified attributes
  def fill_database
    @first = Page.create!(name: 'First',
                          title: 'Title',
                          text: 'text',
                          path: ['First'])
    @subpage1 = Page.create!(name: 'Subpage1',
                             title: 'Subpage1 title',
                             text: 'Subpage1 text',
                             parent_id: @first.id,
                             path: [@first.name, 'Subpage1'])
    @subpage2 = Page.create!(name: 'Subpage2',
                             title: 'Subpage2 title',
                             text: 'Subpage2 text',
                             parent_id: @first.id,
                             path: [@first.name, 'Subpage2'])
    @subsubpage = Page.create!(name: 'Subsubpage',
                               title: 'Subsubpage title',
                               text: 'Subsubpage text',
                               parent_id: @subpage1.id,
                               path: [@first.name, @subpage1.name, 'Subsubpage'])
    @second = Page.create!(name: 'Second',
                           title: 'Title',
                           text: '<p>Bold</p> *text* \\\\text\\\\ ((Second text))',
                           parent_id: @first.id,
                           path: %w[First Second])
    @rus_name_page = Page.create!(name: 'Имя',
                                  title: 'Title',
                                  text: 'text',
                                  parent_id: @first.id,
                                  path: %w[First Имя])
  end

  # authorizes a user
  # returns an authorization token
  def authorize_user(user)
    post auth_login_path, params: { email: user.email, password: user.password }
    JSON.parse(response.body)['auth_token']
  end
end
