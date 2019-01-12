class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :body, :place, :date_from, :date_to, presence: true

  def self.search(search)
    search.delete_if { |_key, object| object.empty? }
    @search_place = search[:search_place]
    @search_start_beg = search[:search_start_beg]
    @search_start_end = search[:search_start_end]
    @search_subject = search[:search_subject]

    result = []
    result << place_search_result
    result << start_time_search_result
    result << subject_search_result
  end

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

  private_class_method def self.place_search_result
    unless @search_place.nil?
      all.map do |object|
        object.id if object.place == @search_place
      end
    end
  end

  private_class_method def self.subject_search_result
    unless @search_subject.nil?
      all.map do |object|
        object.id if object.body.map { |subject| subject.include?(@search_subject) }.reject { |i| i == false }.any?
      end
    end
  end

  private_class_method def self.start_time_search_result
    if !@search_start_beg.nil? && !@search_start_beg.nil?
      all.map do |object|
        object.id if object.date_from.between?(@search_start_beg.to_date, @search_start_end.to_date)
      end
    end
  end

  private

  def place_search_result_notif
    unless @search_place.nil?
      result = id if place == @search_place
      Array(result)
    end
  end

  def subject_search_result_notif
    unless @search_subject.nil?
      result = id if body.map { |subject| subject.include?(@search_subject) }.reject { |i| i == false }.any?
      Array(result)
    end
  end

  def start_time_search_result_notif
    if !@search_start_beg.nil? && !@search_start_beg.nil?
      result = id if date_from.between?(@search_start_beg.to_date, @search_start_end.to_date)
      Array(result)
    end
  end
end
