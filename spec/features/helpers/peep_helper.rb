module PeepHelper

  def add_peep(message, maker_id)
    visit '/peeps/new'
    fill_in 'message' , with: message
    click_button 'Peep'
  end

end