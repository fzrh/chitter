require 'spec_helper'

feature 'Maker signs up' do
	
  scenario 'when being logged out' do
    expect{ sign_up }.to change{Maker.count}.from(0).to(1)
    expect(page).to have_content 'Hello Stephen Lloyd'
    expect(Maker.first.name).to eq 'Stephen Lloyd'
  end

  scenario 'with a password that do not match' do
    expect{ sign_up('Stephen Lloyd', 'Stephen_lloyd','stephen@makers.com', 's3cr3t', 'secret') }.to change{Maker.count}.by(0)
    expect(current_path).to eq '/makers'
    expect(page).to have_content 'Sorry, your passwords do not match'
  end

  scenario 'with an email that is already registered' do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect{ sign_up }.to change(Maker, :count).by 0
    expect(page).to have_content 'This email has already been registered'
  end

  scenario 'with a username that is in use' do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect{ sign_up }.to change(Maker, :count).by 0
    expect(page).to have_content 'This username is already in use'
  end

  def sign_up(name = "Stephen Lloyd", username = "Stephen_lloyd", email = "stephen@makers.com", password = "s3cr3t", password_confirmation = "s3cr3t")
  	visit '/makers/signup'
  	fill_in :name, with: name
  	fill_in :username, with: username
  	fill_in :email, with: email
  	fill_in :password, with: password
  	fill_in :password_confirmation, with: password_confirmation
  	click_button "Sign up"
  end

end

feature 'Maker signs in' do

  before(:each) do
    Maker.create(name: 'Stephen Lloyd', username: 'Stephen_lloyd', email: 'stephen@makers.com' , password: 's3cr3t', password_confirmation: 's3cr3t')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content 'Hello Stephen Lloyd'
    sign_in('Stephen_lloyd', 's3cr3t')
    expect(page).to have_content 'Hello Stephen Lloyd'
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content 'Hello Stephen Lloyd'
    sign_in('Stephen_lloyd', 'secret')
    expect(page).not_to have_content 'Hello Stephen Lloyd'
  end

  def sign_in(username, password)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
