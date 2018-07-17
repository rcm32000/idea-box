require 'rails_helper'

describe 'idea index page functions' do
  before(:each) do
    @user1 = User.create(name: 'Bob', username: 'controller', password: 'gahe', role: 0)
    @user2 = User.create(name: 'Jeannine', username: 'boss', password: 'ghkjfs', role: 0)
    @category1 = Category.create(name: 'Mental')
  end
  context 'user can create an idea' do
    it 'should show a new idea option' do
      visit user_ideas_path(@user1)
      click_link 'Create Idea'

      expect(current_path).to eq(new_user_idea_path(@user1))
      expect(page).to have_content('Title')
      expect(page).to have_content('Description')
    end
  end
end
