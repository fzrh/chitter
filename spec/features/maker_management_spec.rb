require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

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
    expect(page).to have_content 'We already have that email'
  end

  scenario 'with a username that is in use' do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect{ sign_up }.to change(Maker, :count).by 0
    expect(page).to have_content 'This username is already in use'
  end

  scenario 'with empty forms' do
    expect{ sign_up('', '', '','','')}.to change{Maker.count}.by(0)
    expect(current_path).to eq '/makers'
    expect(page).to have_content 'Name must not be blank'
    expect(page).to have_content 'Username must not be blank'
    expect(page).to have_content 'We need your email address'
    expect(page).to have_content 'Password must be at least 5 characters long'
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

end

feature 'Maker signs out' do

  before(:each) do
  	Maker.create(name: 'Stephen Lloyd', username: 'Stephen_lloyd', email: 'stephen@makers.com', password: 's3cr3t', password_confirmation: 's3cr3t')
  end

  scenario 'while being signed in' do
    sign_in('Stephen_lloyd', 's3cr3t')
    click_button 'Sign out'
    expect(page).to have_content 'See you again soon!'
    expect(page).not_to have_content 'Hello Stephen Lloyd'
  end

end
