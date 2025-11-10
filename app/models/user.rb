class User < ApplicationRecord
  validates :github_id, presence: true, uniqueness: true
end
