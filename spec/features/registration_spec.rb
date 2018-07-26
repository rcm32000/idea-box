require 'rails_helper'

describe 'Registration workflow' do
  before(:each) do
    User.create(name: 'Chirs', username: 'thedude', password: 'abcde')
  end
  it 'sumbits a registration form successfully' do
    name = 'Bob'
    username = 'gentlegiant'
    password = '12345'
    visit root_path

    click_on 'Sign Up to Be a New User'

    expect(current_path).to eq(new_user_path)

    fill_in :user_name, with: name
    fill_in :user_username, with: username
    fill_in :user_password, with: password

    click_on 'Create User'

    expect(current_path).to eq(admin_user_path(User.last))
    expect(page).to have_content("Welcome, #{name}!")
    expect(page).to_not have_content('That Username is Unavailable')
  end

  it 'sumbits a registration form unsuccessfully with duplicate username' do
    name = 'Bob'
    username = 'gentlegiant'
    password = '12345'
    User.create(name: name, username: username, password: password)
    visit root_path

    click_on 'Sign Up to Be a New User'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: name
    fill_in :user_username, with: username
    fill_in :user_password, with: password

    click_on 'Create User'

    expect(current_path).to eq(admin_users_path)
    expect(page).to_not have_content("Welcome, #{name}!")
    expect(page).to have_content('That Username is Unavailable')
  end
end
