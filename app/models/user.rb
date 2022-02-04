class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :records, dependent: :destroy
  has_many :medical_results, through: :records, dependent: :destroy
  has_many :medical_images, through: :records, dependent: :destroy
  has_many :prescriptions, through: :records, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def to_label
    "#{dni}-#{user_name}"
  end

  validates :user_name, :address, presence: true
  validates :phone, uniqueness: true
  validates :dni, uniqueness: true
end
