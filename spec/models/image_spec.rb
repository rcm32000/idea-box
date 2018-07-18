require 'rails_helper'

describe Image do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:link) }
  end
end
