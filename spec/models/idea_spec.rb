require 'rails_helper'

describe Idea do
  context 'vaildations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
