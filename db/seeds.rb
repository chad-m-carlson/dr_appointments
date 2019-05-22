3.times do |p|
  Patient.create(first_name: "#{p}_first", last_name: "#{p}_last")
  Doctor.create(first_name: "#{p}_first", last_name: "#{p}_last", specialty: "#{p}_specialty")
end

Appointment.create(doctor_id: Doctor.first.id, patient_id: Patient.last.id)
Appointment.create(doctor_id: Doctor.first.id, patient_id: Patient.first.id)