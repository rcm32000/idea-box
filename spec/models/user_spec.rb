require 'rails_helper'

describe User do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end

  context 'role testing' do
    it 'can be created as an admin' do
      user = User.create(username: 'Scott', password: '12345', role: 1)

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end
    it 'can be created as a default user' do
      user = User.create(username: 'Charlotte', password: 'abcde', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
