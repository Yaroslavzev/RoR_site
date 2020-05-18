# frozen_string_literal: true

class SearchService < ApplicationService
  attr_reader :search
  
  def initialize(search)
    @search = search
  end
  
  def call
    Event.yield_self(&method(:search_start_time))
         .yield_self(&method(:search_subjects))
         .yield_self(&method(:search_places))
    # binding.pry     
    # cc
  end
  
  private
  
  def search_places(scope)
    scope = scope.where("place LIKE ?", "%#{search[:search_place]}%") if search[:search_place].present?
    scope
  end
  
  def search_start_time(scope)
    scope = scope.where(date_from: search[:search_start_beg].to_time..search[:search_start_end].to_time) if range_conditions
     scope
  end
  
  def range_conditions
    search[:search_start_beg].present? && search[:search_start_end].present?
  end
  
  def search_subjects(scope)
    scope = scope.where("array_to_string(body, ' ') ILIKE ?", "%#{search[:search_subject]}%") if search[:search_subject].present? 
    scope
  end
end