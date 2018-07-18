class Idea < ApplicationRecord
  validates_presence_of :user_id, :category_id, :title, :description, presence: true
  belongs_to :user
  belongs_to :category
  has_many :ideaimages
  has_many :images, through: :ideaimages
end
