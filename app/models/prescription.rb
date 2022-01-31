class Prescription < ApplicationRecord
  has_one :record
  has_one :user
  has_many_attached :photos
end
