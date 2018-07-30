class IdeaImage < ApplicationRecord
  validates_presence_of :idea_id, :image_id, presence: true
  belongs_to :idea
  belongs_to :image
end
