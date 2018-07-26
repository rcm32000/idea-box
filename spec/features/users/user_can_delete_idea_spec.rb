require 'rails_helper'

describe 'User can delete a specific idea' do
  scenario 'a user deletes an idea' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')
    category = Category.create(name: 'Useless')
    idea = user.ideas.create(category_id: category.id,
                             title: 'Whatever',
                             description: 'Yeah Right')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_idea_path(user, idea)
    click_button 'Delete'

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to have_content("#{idea.title} was successfully deleted!")
  end
end
