# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

paris = City.create(name: 'Paris')
lyon = City.create(name: 'Lyon')

cardio = Specialty.create(name: 'Cardiologie')
dermato = Specialty.create(name: 'Dermatologie')

d1 = Doctor.create(first_name: 'John', last_name: 'Doe', city: paris)
d2 = Doctor.create(first_name: 'Jane', last_name: 'Smith', city: lyon)
d1.specialties << cardio
d2.specialties << dermato

d1 = Doctor.create(first_name: 'John', last_name: 'Doe', city: paris)
d2 = Doctor.create(first_name: 'Jane', last_name: 'Smith', city: lyon)
d1.specialties << cardio
d2.specialties << dermato

p1 = Patient.create(first_name: 'Alice', last_name: 'Dupont', city: paris)
p2 = Patient.create(first_name: 'Bob', last_name: 'Martin', city: lyon)
Appointment.create(date: DateTime.now, doctor: d1, patient: p1, city: paris)

appointment1 = Appointment.create(date: DateTime.now + 1.day, doctor: d1, patient: p1, city: paris)
appointment2 = Appointment.create(date: DateTime.now + 2.days, doctor: d2, patient: p2, city: lyon)