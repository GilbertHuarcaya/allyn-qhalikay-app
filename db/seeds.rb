# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Clinic.destroy_all
Record.destroy_all

user = User.create(
  email: "qhali@gmail.com", password: "123456", password_confirmation: "123456",
  user_name: "allin qhalikay", address: "lima Perú", dni: "00000000", doctor: true, admin: true, phone: "300328",
)
#user.photo.attach(io: open("./app/assets/images/user.jpg"), filename: "user.jpg", content_type: "image/jpg")
#user.photo.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

user.save!

clinic = Clinic.create!(
  name: "Auna", address: "Lima", phone: "050607", description: "Atiende todas las especialidades",
)

record = Record.new(
  appointment: "31/01/2022",
  user: user,
  clinic: clinic,
)
record.save!

medical1 = MedicalImage.new(title: "imagen", record: record)
medical_image = URI.open("https://images.unsplash.com/photo-1643754713080-cbfc5be44520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
medical1.photo.attach(io: medical_image, filename: "foto.jpg", content_type: "image/jpg")
medical1.save!

medical_result1 = MedicalResult.new(title: "imagen", record: record)
medical_result_image = URI.open("https://images.unsplash.com/photo-1643754713080-cbfc5be44520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
medical_result1.photo.attach(io: medical_result_image, filename: "foto.jpg", content_type: "image/jpg")
medical_result1.save!

prescription1 = Prescription.new(title: "imagen", record: record)
prescription_image = URI.open("https://images.unsplash.com/photo-1643754713080-cbfc5be44520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
prescription1.photo.attach(io: prescription_image, filename: "foto.jpg", content_type: "image/jpg")
prescription1.save!
#user.photo.attach(io: open("./app/assets/images/user.jpg"), filename: "user.jpg", content_type: "image/jpg")
#user.photo.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

clinic2 = Clinic.create!(
  name: "El golf", address: "Lima", phone: "050607", description: "Atiende todas las especialidades",
)
record2 = Record.create!(
  appointment: "10/01/2022", user: user,
  clinic: clinic2,
)
record2.save
