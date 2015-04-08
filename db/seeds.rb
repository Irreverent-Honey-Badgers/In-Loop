# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Event.create(title: 'test 1', start: '2015-03-23 12:30:00', end_datetime: '2015-03-23 13:30:00', description: 'this should show up on the calendar')

Appointment.create(patient_id: 1, doctor_id: 1, address: '61 West 23rd Street', city: 'New York', state: 'New York', zip: 10011, title: 'Sore Tooth', start: '2015-04-09 10:00:00', end: '2015-04-09 11:00:00')
Appointment.create(patient_id: 1, doctor_id: 2, address: '625 Avenue of the Americas', city: 'New York', state: 'New York', zip: 10010, title: 'Stomach Ache', start: '2015-04-09 10:00:00', end: '2015-04-09 11:00:00')
Appointment.create(patient_id: 2, doctor_id: 1, address: '61 West 23rd Street', city: 'New York', state: 'New York', zip: 10011, title: 'Wisdom Teeth', start: '2015-04-10 10:00:00', end: '2015-04-10 11:00:00')
Appointment.create(patient_id: 2, doctor_id: 2, address: '625 Avenue of the Americas', city: 'New York', state: 'New York', zip: 10010, title: 'Ulcer', start: '2015-04-10 10:00:00', end: '2015-04-10 11:00:00')
