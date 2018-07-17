require 'rails_helper'

describe 'user can' do
  it 'create an idea' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')
    category = Category.create(name: 'Useless')
    idea_title = 'Whatever'
    idea_description = 'Yeah right'

    visit user_ideas_path(user)

    click_link 'Create Idea'

    expect(current_path).to eq(new_user_idea_path(user))

    select category.name, from: :idea_category_id
    fill_in :idea_title, with: idea_title
    fill_in :idea_description, with: idea_description
    click_button 'Create Idea'

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to have_content(idea_title)
    expect(page).to have_content(category.name)
  end
end
