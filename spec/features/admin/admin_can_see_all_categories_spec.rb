require 'rails_helper'

describe 'catagories index page' do
  it 'shows admin all categories' do
    user = User.create(name: 'Adam', username: 'TheMan', password: 'khsdgd', role: 1)
    category1 = Category.create(name: 'Aww Yeah')
    category2 = Category.create(name: 'DIY')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
  end
end
