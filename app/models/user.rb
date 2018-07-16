class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :name, :password, require: true

  has_secure_password
end
