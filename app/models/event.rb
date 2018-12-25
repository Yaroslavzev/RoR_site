class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user


    def self.search(search)


      @search_city = search[:search_city]
      @search_start_beg = search[:search_start_beg].to_date
      @search_start_end = search[:search_start_end].to_date
      @search_subject = search[:search_subject]
      #p start_time_search_result.compact

      #p city_search_result.compact
      #p subject_search_result.compact

      p start_time_search_result.compact & subject_search_result.compact & city_search_result.compact
    end

    def self.city_search_result
      self.all.map do |object|
              object.id if object.city == @search_city
      end
    end

    def self.subject_search_result
      self.all.map do |object|
        object.id if (object.title).include? @search_subject
      end
    end

    def self.start_time_search_result
      self.all.map do |object|
        object.id if (object.date_from).between?(@search_start_beg, @search_start_end)
      end
    end
end


 #find_by(city: search[:search_city]) if search[:search_city]
