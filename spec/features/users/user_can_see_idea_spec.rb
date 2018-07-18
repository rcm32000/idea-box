require 'rails_helper'

describe 'User sees a specific idea' do
  scenario 'a user sees an idea' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')
    category = Category.create(name: 'Useless')
    idea = user.ideas.create(category_id: category.id,
                             title: 'Whatever',
                             description: 'Yeah Right')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit idea_path(idea)

    expect(page).to have_content(category.name)
    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.description)
  end
end
