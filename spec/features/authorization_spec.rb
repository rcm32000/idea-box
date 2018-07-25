require 'rails_helper'

describe 'Authorization' do
  it 'will not allow guest to see ideas' do
    visit ideas_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Please Login')
  end
end
