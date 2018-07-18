class Image < ApplicationRecord
  validates_presence_of :title, :link, uniqueness: true, presence: true

  has_many :ideaimages
  has_many :ideas, through: :ideaimages
end
