class Category < ApplicationRecord
  validates_presence_of :name, uniqueness: true, presence: true

  has_many :ideas, dependent: :destroy
end
