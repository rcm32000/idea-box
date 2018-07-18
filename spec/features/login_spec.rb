require 'rails_helper'

describe 'login' do
  it 'can login a user' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')

    visit root_path

    click_link 'Login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Login'

    expect(current_path).to eq(ideas_path)
    expect(page).to have_button('Logout')
    expect(page).to_not have_content('That Username/Password Combo Does Not Exist')
  end

  it 'can shows an error message on unsuccessful login attempt' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')

    visit root_path

    click_link 'Login'

    fill_in :username, with: user.username
    fill_in :password, with: 'Password'

    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to_not have_button('Logout')
    expect(page).to have_content('That Username/Password Combo Does Not Exist')
  end
end
