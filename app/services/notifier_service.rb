# frozen_string_literal: true

class NotifierService < ApplicationService
  def initialize(event)
    @event = event
  end

  def call
    searches = Search.yield_self(&method(:search_start_time))
                     .yield_self(&method(:search_places))
                     .yield_self(&method(:search_subjects))

    searches.each { |search| Notification.create(user_id: search.user.id, search_id: search.id, event_id: @event.id) }
  end

  private

  def search_places(scope)
    scope.or(Search.where("search_place IS NOT NULL AND trim(search_place) != '' \
                           AND :event_place ILIKE '%' || search_place || '%'", event_place: @event.place))
  end

  def search_start_time(scope)
    scope.where(":start_at BETWEEN search_start_beg AND search_start_end", start_at: @event.date_from)
  end

  def search_subjects(scope)
    scope.or(Search.where("search_subject IS NOT NULL AND trim(search_subject) != '' \
                           AND :event_body ILIKE '%' || search_subject || '%'", event_body: @event.body.join))
  end
end
