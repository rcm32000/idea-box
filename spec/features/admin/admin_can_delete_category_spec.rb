require 'rails_helper'

describe 'category deletion' do
  it 'allows admin to delete category' do
    category = Category.create(name: 'DIY')

    visit admin_category_path(category)
    click_button 'Delete'

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("#{category.name} was successfully deleted!")
  end
end
