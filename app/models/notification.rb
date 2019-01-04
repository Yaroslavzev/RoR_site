class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :search


  scope :unread, -> {where(read_at: nil)}
end
