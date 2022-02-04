class Clinic < ApplicationRecord
  has_many :records
  has_one_attached :photo
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def to_label
    "#{name}-#{address}"
  end

  validates :description, :name, :address, :phone, presence: true
  validates :description, length: { minimum: 6 }
  validates :phone, uniqueness: true
  validates :address, uniqueness: true
  include PgSearch::Model
  pg_search_scope :search_by_address_and_name,
                  against: [:address, :name],
                  using: {
                    tsearch: { prefix: true }, # <-- now `superman batm` will return something!
                  }
end
