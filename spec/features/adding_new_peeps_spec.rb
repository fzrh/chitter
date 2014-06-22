require 'spec_helper'
require_relative 'helpers/session'

feature 'Maker can peep' do
	
  before(:each) do
    Maker.create(name: 'Stephen Lloyd', username: 'Stephen_lloyd', email: 'stephen@makers.com' , password: 's3cr3t', password_confirmation: 's3cr3t')
  end

  scenario 'whilst signed-out' do
    expect(Peep.count).to eq 0
    visit '/peeps/new'
    expect(page).to have_content 'You need to be signed-in to peep'
  end

  scenario 'whilst signed-in' do
    expect(Peep.count).to eq 0
    sign_in('Stephen_lloyd', 's3cr3t')
    add_peep('Hello Chitters!', @maker_id)
    expect(Peep.count).to eq 1
    peep = Peep.first
    expect(peep.message).to eq 'Hello Chitters!'
  end

  def add_peep(message, maker_id)
    visit '/peeps/new'
    fill_in 'message' , with: message
    click_button 'Peep'
  end

end