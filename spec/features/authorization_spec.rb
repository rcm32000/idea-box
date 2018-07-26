require 'rails_helper'

describe 'Authorization' do
  it 'will not allow guest to see ideas' do
    user = User.new
    visit "/user/#{user.id}/ideas"

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Please Login')
  end
end
