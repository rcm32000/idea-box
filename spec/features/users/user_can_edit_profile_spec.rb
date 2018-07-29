require 'rails_helper'
describe 'user profile page' do
  it 'allows user to edit their own profile info' do
    user = User.create(name: 'Eliot', username: 'ruderunner', password: 'pussword')
    new_name = 'Rob'
    new_username = 'roadrunner'
    new_password = 'password'
    visit root_path

    within '.nav-bar' do
      click_button 'Login'
    end

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within '.login_form' do
      click_button 'Login'
    end

    visit user_ideas_path(user)
    click_button 'Profile'
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.username)
    expect(page).to_not have_content(user.password)

    click_button 'Edit Profile'
    expect(current_path).to eq(edit_user_path(user))

    fill_in :user_name, with: new_name
    fill_in :user_username, with: new_username
    fill_in :user_password, with: new_password
    click_button 'Save'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(new_name)
    expect(page).to have_content(new_username)
    expect(page).to_not have_content('Eliot')
    expect(page).to_not have_content('ruderunner')

    click_button 'Logout'

    within '.nav-bar' do
      click_button 'Login'
    end

    fill_in :username, with: new_username
    fill_in :password, with: new_password

    within '.login_form' do
      click_button 'Login'
    end

    expect(current_path).to eq(user_ideas_path(user))
  end
end
