require 'rails_helper'

describe 'user can' do
  it 'create an idea' do
    user = User.create(name: 'Jimmy', username: 'khgsw', password: 'password')
    category = Category.create(name: 'Useless')
    image1 = Image.create(title: 'Light Bulb', link: 'www.lightbulbsrus.io')
    image2 = Image.create(title: 'Candle', link: 'www.flickering.net')
    idea_title = 'Whatever'
    idea_description = 'Yeah right'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit ideas_path

    click_link 'Create Idea'

    expect(current_path).to eq(new_idea_path)

    select category.name, from: :idea_category_id
    fill_in :idea_title, with: idea_title
    fill_in :idea_description, with: idea_description
    select image1.title, from: :idea_image_id
    select image2.title, from: :idea_image_id
    click_button 'Save Idea'

    expect(current_path).to eq(idea_path(Idea.last))
    expect(page).to have_content(idea_title)
    expect(page).to have_content(category.name)
    expect(page).to have_content(image1.title)
    expect(page).to have_content(image2.title)
  end
end