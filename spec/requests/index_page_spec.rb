RSpec.describe 'Index', type: :request do
  before(:each) do
    fill_database
  end

  it ' should have subpages names' do
    get('/')
    expect(status).to eq(200)
    expect(response.body).to include(@first.name)
    expect(response.body).to include(@subpage1.name)
    expect(response.body).to include(@subpage2.name)
    expect(response.body).to include(@subsubpage.name)
    expect(response.body).to include(@second.name)
  end
end
