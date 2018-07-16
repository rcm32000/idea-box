require 'rails_helper'

describe User do
  context 'vaildations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end
end
