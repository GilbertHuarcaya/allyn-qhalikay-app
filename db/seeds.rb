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

medical_image = MedicalImage.create!
medical_result = MedicalResult.create!
prescription = Prescription.create!

Record.create!(
  appointment: "31/01/2022", user: user,
  clinic: clinic,
  medical_image: medical_image,
  medical_result: medical_result,
  prescription: prescription,
)
record.save


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
