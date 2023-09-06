RSpec.describe 'Add root page', type: :request do
  before(:each) do
    fill_database
  end

  it 'should have only the title and page labels' do
    get('/First/edit')
    expect(status).to eq(200)
    expect(response.body).not_to include('Name')
    expect(response.body).to include('Title')
    expect(response.body).to include('Text')
  end

  it 'should edit the page' do
    put('/First/edit', params: { page: { title: 'First edited title', text: 'First edited text' } })
    get('/First')
    expect(status).to eq(200)
    expect(response.body).to include('First edited title')
    expect(response.body).to include('First edited text')
  end
end
