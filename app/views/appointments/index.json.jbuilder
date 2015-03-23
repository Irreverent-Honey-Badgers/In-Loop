json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :title, :description
  json.start appointment.start_datetime
  json.end appointment.end_datetime
  json.url appointment_url(appointment, format: :json)
end
