class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :body, :place, :date_from, :date_to, presence: true

  def search_notif(search)
    search.delete_if { |_key, object| object.empty? }
    @search_place = search[:search_place]
    @search_start_beg = search[:search_start_beg]
    @search_start_end = search[:search_start_end]
    @search_subject = search[:search_subject]

    result = []
    result << place_search_result_notif
    result << start_time_search_result_notif
    result << subject_search_result_notif
  end
  
  private

  def place_search_result_notif
    return if @search_place.nil?
    Array.new(1) { id } if place == @search_place
  end

  def subject_search_result_notif
    return if @search_subject.nil?
    Array.new(1) { id } if body.map { |subject| subject.include?(@search_subject) }.reject { |i| i == false }.any?
  end

  def start_time_search_result_notif
    return unless @search_start_beg.nil? && @search_start_beg.nil?
    Array.new(1) { id } if date_from.between?(@search_start_beg.to_date, @search_start_end.to_date)
  end
end
