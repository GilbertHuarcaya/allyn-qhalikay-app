class Record < ApplicationRecord
  belongs_to :clinic
  belongs_to :user
  belongs_to :medical_image
  belongs_to :medical_result
  belongs_to :prescription
end
