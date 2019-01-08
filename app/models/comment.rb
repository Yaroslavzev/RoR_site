class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :event

  validates :body, presence: true
end
