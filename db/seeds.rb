# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Record.destroy_all
Clinic.destroy_all
User.destroy_all

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
medical1 = MedicalImage.new
medical_image = URI.open("https://images.unsplash.com/photo-1643754713080-cbfc5be44520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
medical1.photos.attach(io: medical_image, filename: 'foto.jpg', content_type: 'image/jpg')

medical_result2 = MedicalResult.new
medical_result_image = URI.open("https://images.unsplash.com/photo-1643754713080-cbfc5be44520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
medical_result2.photos.attach(io: medical_result_image, filename: 'foto.jpg', content_type: 'image/jpg')

prescription2 = Prescription.new
prescription_image = URI.open("https://images.unsplash.com/photo-1643754713080-cbfc5be44520?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
prescription2.photos.attach(io: prescription_image, filename: 'foto.jpg', content_type: 'image/jpg')

record = Record.new(
  appointment: "31/01/2022",
  user: user,
  clinic: clinic,
  medical_image: medical1,
  medical_result: medical_result2,
  prescription: prescription2,
)
record.save!


#user.photo.attach(io: open("./app/assets/images/user.jpg"), filename: "user.jpg", content_type: "image/jpg")
#user.photo.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')



clinic2 = Clinic.create!(
  name: "El golf", address: "Lima", phone: "050607", description: "Atiende todas las especialidades"
)

medical_image2 = MedicalImage.create!
medical_result2 = MedicalResult.create!
prescription2 = Prescription.create!

record2 = Record.create!(
  appointment: "10/01/2022", user: user,
  clinic: clinic2,
  medical_image: medical_image2,
  medical_result: medical_result2,
  prescription: prescription2
)
record2.save
