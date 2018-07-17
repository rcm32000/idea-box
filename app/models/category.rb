class Category < ApplicationRecord
  validates_presence_of :name, presence: true

  has_many :ideas
end
