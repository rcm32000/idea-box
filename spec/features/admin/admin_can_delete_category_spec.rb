require 'rails_helper'

describe 'category deletion' do
  it 'allows admin to delete category' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password', role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(name: 'DIY')

    visit admin_category_path(category)

    click_button 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("#{category.name} was successfully deleted!")
  end
end
