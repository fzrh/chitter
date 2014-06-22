feature "Maker browses the list of peeps" do

  before(:each) { Peep.create(:message => "Hello Chitters!") }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Hello Chitters!")
  end

end