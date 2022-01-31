class Prescription < ApplicationRecord
  has_one :record
  has_one :user, through: :records
  has_many_attached :photos
end
