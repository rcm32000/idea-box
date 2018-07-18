require 'rails_helper'

describe 'create image' do
  it 'allows admin to create an image' do
    user = User.create(name: 'Sam', username: 'yodude', password: 'hgje', role: 1)
    title = 'New Image'
    link = 'www.thatimage.com'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit images_path
    click_button 'Create Image'

    expect(current_path).to eq(new_image_path)

    fill_in :image_title, with: title
    fill_in :image_link, with: link
    click_button 'Save Image'

    expect(current_path).to eq(image_path(Image.last))
    expect(page).to have_content(title)
    expect(page).to have_content(link)
  end
end
