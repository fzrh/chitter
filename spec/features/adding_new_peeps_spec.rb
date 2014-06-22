require 'spec_helper'
require_relative 'helpers/session'

feature 'Maker can peep' do
	
  before(:each) do
    Maker.create(name: 'Stephen Lloyd', username: 'Stephen_lloyd', email: 'stephen@makers.com' , password: 's3cr3t', password_confirmation: 's3cr3t')
  end

  scenario 'whilst logged out' do
    expect(Peep.count).to eq 0
    visit '/peeps/new'
    expect(page).to have_content 'You need to be signed-in to peep'
  end

end