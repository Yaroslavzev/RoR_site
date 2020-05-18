class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :body, :place, :date_from, :date_to, presence: true
end
