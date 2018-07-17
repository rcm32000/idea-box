class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :name, :password, require: true

  enum role: %w(default admin)

  has_secure_password

  has_many :ideas
end
