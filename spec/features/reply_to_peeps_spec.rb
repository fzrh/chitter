require 'spec_helper'
require_relative 'helpers/session'
require_relative 'helpers/peep_helper'

include SessionHelpers
include PeepHelper

feature 'Maker replies to peeps' do
	
  before(:each) do
    Maker.create(name: 'Stephen Lloyd', username: 'Stephen_lloyd', email: 'stephen@makers.com' , password: 's3cr3t', password_confirmation: 's3cr3t')
  end

  scenario 'not whilst signed out' do
    visit '/'
    expect(page).not_to have_content 'reply to peep'
  end

  scenario 'whilst signed in' do
    sign_in('Stephen_lloyd', 's3cr3t')
    add_peep('Hello Chitters!', @maker_id)
    click_link('reply to peep')
    expect(current_path).to eq '/peeps/reply'
  end

end