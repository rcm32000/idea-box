require 'rails_helper'

describe 'admin dashboard' do
  it 'can visit categories index' do
    user = User.create(name: 'Adam', username: 'TheMan', password: 'khsdgd', role: 1)
    category1 = Category.create(name: 'Aww Yeah')
    category2 = Category.create(name: 'DIY')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    click_link 'Categories'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
  end

  it 'can visit images index' do
    user = User.create(name: 'Adam', username: 'TheMan', password: 'khsdgd', role: 1)
    image1 = Image.create(title: 'Light Bulb', link: "http://cdn.financialsamurai.com/wp-content/uploads/2011/03/lightbulb.jpg")
    image2 = Image.create(title: 'Gadget', link: "https://pbs.twimg.com/profile_images/558205571220779008/rsB4JqwX_400x400.jpeg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    click_link 'Images'

    expect(current_path).to eq(admin_images_path)
    expect(page).to have_content(image1.title)
    expect(page).to have_content(image2.title)
  end

  it 'can visit users index' do
    user1 = User.create(name: 'Adam', username: 'TheMan', password: 'khsdgd', role: 1)
    user2 = User.create(name: 'Jude', username: 'limey', password: 'khsdgd')
    user3 = User.create(name: 'Lucy', username: 'princess', password: 'khsdgd')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit admin_dashboard_path

    click_link 'Users'

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user3.name)
  end

  it 'can visit dashboard' do
    user = User.create(name: 'Adam', username: 'TheMan', password: 'khsdgd', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_users_path

    click_link 'Dashboard'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content('Catagories: ')
    expect(page).to have_content('Images: ')
    expect(page).to have_content('Users: ')
  end
end
