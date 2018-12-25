json.extract! event, :id, :title, :body, :user_id, :visible, :created_at, :updated_at
json.url event_url(event, format: :json)
