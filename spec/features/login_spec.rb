require 'rails_helper'

describe 'login' do
  it 'can login a user' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')

    visit root_path

    click_link 'Login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within '.login_form' do
      click_button 'Login'
    end

    expect(current_path).to eq(ideas_path)
    expect(page).to have_button('Logout')
    expect(page).to_not have_content('That Username/Password Combo Does Not Exist')
  end

  it 'can login an admin' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password', role: 1)

    visit root_path

    click_link 'Login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within '.login_form' do
      click_button 'Login'
    end

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_button('Logout')
    expect(page).to have_link('Categories')
    expect(page).to have_link('Images')
    expect(page).to have_link('Users')
    expect(page).to_not have_content('That Username/Password Combo Does Not Exist')
  end

  it 'can shows an error message on unsuccessful login attempt' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')

    visit root_path

    click_link 'Login'

    fill_in :username, with: user.username
    fill_in :password, with: 'Password'

    within '.login_form' do
      click_button 'Login'
    end

    expect(current_path).to eq(login_path)
    expect(page).to_not have_button('Logout')
    expect(page).to have_content('That Username/Password Combo Does Not Exist')
  end

  it 'allows user to logout' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')

    visit root_path

    click_link 'Login'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within '.login_form' do
      click_button 'Login'
    end
    click_button 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to_not have_button('Logout')
    expect(page).to have_button('Login')
    expect(page).to have_content('You have been successfully logged out')
  end
end
