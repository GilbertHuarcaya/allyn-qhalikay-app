class Record < ApplicationRecord
  belongs_to :clinic
  belongs_to :user
  belongs_to :medical_image
  belongs_to :medical_result
  belongs_to :prescription

  validates :appointment, presence: true
  pg_search_scope :search_by_date,
                  against: [:appointment],
                  using: {
                    tsearch: { prefix: true }, # <-- now `superman batm` will return something!
                  }
end
