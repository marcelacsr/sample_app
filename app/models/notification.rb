class Notification < ApplicationRecord

  belongs_to :followed, class_name: 'User'
  # t.integer "followed_id"

  belongs_to :follower, class_name: 'User'
  # t.integer "follower_id"

  validates :follower_id, presence: true
  validates :followed_id, presence: true





  # validates :message, presence: true
  #
  # def send_follow_notification(other_user)
  #   Notification.create({followed_id: other_user.id, follower_id: id})
  # end


end
