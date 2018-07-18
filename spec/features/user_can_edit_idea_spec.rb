require 'rails_helper'

describe 'User can edit a specific idea' do
  scenario 'a user edits an idea' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')
    category1 = Category.create(name: 'Useless')
    category2 = Category.create(name: 'Worth While')
    idea = user.ideas.create(category_id: category1.id,
                             title: 'Whatever',
                             description: 'Yeah Right')
    new_title = 'Can Do'
    new_description = 'Willingness to Succeed'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit idea_path(idea)
    click_button 'Edit'

    expect(current_path).to eq(edit_idea_path(idea))

    select category2.name, from: :idea_category_id
    fill_in :idea_title, with: new_title
    fill_in :idea_description, with: new_description
    click_button 'Save Idea'

    expect(current_path).to eq(idea_path(idea))
    expect(page).to have_content(category2.name)
    expect(page).to have_content(new_title)
    expect(page).to have_content(new_description)
  end
end
