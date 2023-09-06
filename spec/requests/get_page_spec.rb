RSpec.describe 'Page', type: :request do
  before(:each) do
    fill_database
  end

  it 'should have a title and page' do
    get("/#{@first.name}")
    expect(status).to eq(200)
    expect(response.body).to include(@first.title)
    expect(response.body).to include(@first.text)
  end

  it ' should have subpages names' do
    get("/#{@first.name}")
    expect(status).to eq(200)
    expect(response.body).to include(@subpage1.name)
    expect(response.body).to include(@subpage2.name)
    expect(response.body).to include(@subsubpage.name)
  end

  it ' should have formatted text' do
    get("/#{@first.name}/#{@second.name}")
    expect(status).to eq(200)
    expect(response.body).to include('<p>Bold</p>')
    expect(response.body).to include('<b>text</b>')
    expect(response.body).to include('<i>text</i>')
    expect(response.body).to include('<a href="/Second">text</a>')
  end
end
