class Clinic < ApplicationRecord
  has_many :records
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :description, :name, :address, :phone, presence: true
end
