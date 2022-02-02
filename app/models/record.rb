class Record < ApplicationRecord
  belongs_to :clinic
  belongs_to :user
  has_many :medical_images, dependent: :destroy
  has_many :medical_results, dependent: :destroy
  has_many :prescriptions, dependent: :destroy

  validates :appointment, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_date,
                  against: [:appointment],
                  using: {
                    tsearch: { prefix: true }, # <-- now `superman batm` will return something!
                  }
end
