class AddCityToDoctorsPatientsAppointments < ActiveRecord::Migration[7.2]
  def change
    add_reference :doctors, :city, foreign_key: true
    add_reference :patients, :city, foreign_key: true
    add_reference :appointments, :city, foreign_key: true
  end
end
