class Image < ApplicationRecord
  validates_presence_of :title, :link, uniqueness: true, presence: true

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
