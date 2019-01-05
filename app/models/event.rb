class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  validates :title, :body, :place, :date_from, :date_to, presence: true




    def self.search(search)
      search.delete_if {|key, object| object.empty?}
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
        search.delete_if {|key, object| object.empty?}
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

    def self.place_search_result
      if !@search_place.nil?
        self.all.map do |object|
          object.id if object.place == @search_place
      end
    end
    end

    def self.subject_search_result
      if !@search_subject.nil?
        self.all.map do |object|
          object.id if object.body.map {|subject| subject.include?(@search_subject)}.reject {|i|  i === false }.any?
      end
    end
    end

    def self.start_time_search_result
      if !@search_start_beg.nil? && !@search_start_beg.nil?
        self.all.map do |object|
          object.id if (object.date_from).between?(@search_start_beg.to_date, @search_start_end.to_date)
        end
      end
      end

      def place_search_result_notif
        if !@search_place.nil?
          bb = self.id if self.place == @search_place
            Array(bb)

      end
      end

      def subject_search_result_notif
        if !@search_subject.nil?
            bb = self.id if self.body.map {|subject| subject.include?(@search_subject)}.reject {|i|  i === false }.any?
            Array(bb)


      end
      end

      def start_time_search_result_notif
        if !@search_start_beg.nil? && !@search_start_beg.nil?
            bb = self.id if (self.date_from).between?(@search_start_beg.to_date, @search_start_end.to_date)
            Array(bb)
        end
        end
end


 #find_by(city: search[:search_city]) if search[:search_city]
