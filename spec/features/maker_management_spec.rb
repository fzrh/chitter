require 'spec_helper'

feature 'Maker signs up' do
	
  scenario 'when being logged out' do
    expect{ sign_up }.to change{Maker.count}.from(0).to(1)
    expect(page).to have_content 'Hello Stephen Lloyd'
    expect(Maker.first.name).to eq 'Stephen Lloyd'
  end

  scenario 'with a password that do not match' do
    expect{ sign_up('Stephen Lloyd', 'Stephen_lloyd','stephen@makers.com', 's3cr3t', 'secret') }.to change{Maker.count}.by(0)
  end

  def sign_up(name = "Stephen Lloyd", username = "Stephen_lloyd", email = "stephen@makers.com", password = "s3cr3t", password_confirmation = "s3cr3t")
  	visit '/makers/signup'
  	expect(page.status_code).to eq 200
  	expect(page.status_code).to eq 200
  	fill_in :name, with: name
  	fill_in :username, with: username
  	fill_in :email, with: email
  	fill_in :password, with: password
  	fill_in :password_confirmation, with: password_confirmation
  	click_button "Sign up"
  end

end