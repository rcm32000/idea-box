require 'rails_helper'

describe 'User sees a specific idea' do
  scenario 'a user sees only their idea' do
    user1 = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')
    category1 = Category.create(name: 'Useless')
    idea1 = user1.ideas.create(category_id: category1.id,
                               title: 'Whatever',
                               description: 'Yeah Right')
    user2 = User.create(name: 'Snidley', username: 'bad', password: 'password')
    category2 = Category.create(name: 'Evil')
    idea2 = user2.ideas.create(category_id: category2.id,
                               title: 'Plan',
                               description: 'Never Work')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit idea_path(idea1)

    expect(page).to have_content(category1.name)
    expect(page).to have_content(idea1.title)
    expect(page).to have_content(idea1.description)
    expect(page).to_not have_content(category2.name)
    expect(page).to_not have_content(idea2.title)
    expect(page).to_not have_content(idea2.description)
  end
end
