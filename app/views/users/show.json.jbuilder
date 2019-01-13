json.array! @notifications do |notification|
  json.id notification.id
  json.event_id notification.event_id
  json.search_id notification.search_id
end
