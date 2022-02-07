class MedicalImage < ApplicationRecord
  belongs_to :record
  has_one_attached :photo
  
  validates :title, presence: true
end
