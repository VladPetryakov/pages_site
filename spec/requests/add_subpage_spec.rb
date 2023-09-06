RSpec.describe 'Add root page', type: :request do
  before(:each) do
    fill_database
  end

  it 'should have the name, title and page labels' do
    get('/First/add')
    expect(status).to eq(200)
    expect(response.body).to include('Name')
    expect(response.body).to include('Title')
    expect(response.body).to include('Text')
  end

  it 'should add a new root page' do
    post('/First/add', params: { name: 'new', title: 'new title', text: 'new text' })
    get('/First/new')
    expect(status).to eq(200)
    expect(response.body).to include('new')
    expect(response.body).to include('new title')
    expect(response.body).to include('new text')
  end
end
