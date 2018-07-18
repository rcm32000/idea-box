require 'rails_helper'

describe 'catagories index page' do
  it 'allows admin to create a category' do
    user = User.create(name: 'Adam', username: 'TheMan', password: 'khsdgd', role: 1)
    name = 'New Category'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path
    click_button 'Create Category'

    expect(current_path).to eq(new_category_path)

    fill_in :category_name, with: name
    click_button 'Save Category'

    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content(Category.last.name)
  end
end
