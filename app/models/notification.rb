class Notification < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  # t.integer "followed_id"
  belongs_to :follower, class_name: 'User'
  # t.integer "follower_id"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
