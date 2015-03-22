json.array!(@events) do |event|
  json.extract! event, :id, :title, :description
  json.start event.start_datetime
  json.end event.end_datetime
  json.url event_url(event, format: :json)
end
