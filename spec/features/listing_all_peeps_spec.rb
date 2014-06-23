require 'spec_helper'

feature "Maker browses the list of peeps" do

  # before(:each) do
  #   Maker.create(name: 'Stephen Lloyd', username: 'Stephen_lloyd', email: 'stephen@makers.com' , password: 's3cr3t', password_confirmation: 's3cr3t')

  #   Peep.create(:message => "This is Chitter.")    
  # end

  scenario "when opening the homepage " do
    visit '/'
    expect(page).to have_content("Welcome to Chitter.")
    expect(page).to have_content("What's happening on Chitter:")
  end

end