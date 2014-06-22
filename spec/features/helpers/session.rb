module SessionHelpers

  def sign_up(name = "Stephen Lloyd", username = "Stephen_lloyd", email = "stephen@makers.com", password="s3cr3t", password_confirmation = "s3cr3t")
    visit '/makers/signup'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end