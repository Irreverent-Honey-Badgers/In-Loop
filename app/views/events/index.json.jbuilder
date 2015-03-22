json.array!(@events) do |event|
  json.extract! event, :id, :title, :start_datetime, :end_datetime, :description
  json.url event_url(event, format: :json)
end
