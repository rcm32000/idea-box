require 'rails_helper'

describe Category do
  context 'vaildations' do
    it { should validate_presence_of(:name) }
  end
end
