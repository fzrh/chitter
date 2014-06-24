require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peep_helper'

include PeepHelper

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

  scenario 'with empty peep form' do
    expect(Peep.count).to eq 0
    sign_in('Stephen_lloyd', 's3cr3t')
    add_peep('', @maker_id)
    expect(Peep.count).to eq 0
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'You did not peep anything'
  end

end