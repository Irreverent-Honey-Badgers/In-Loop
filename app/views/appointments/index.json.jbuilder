json.array!(@appoinments) do |appointment|
  json.extract! appointment, :id, :patient_id, :doctor_id, :address, :city, :state, :zip, :created_at, :updated_at, :doctor_office, :eta, :title, :start, :end, :description
  json.url appointment_url(appointment, format: :html)
end
