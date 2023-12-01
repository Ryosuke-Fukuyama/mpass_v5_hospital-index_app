class Hospital < ApplicationRecord
  has_many :hospital_labelings, dependent: :destroy
  has_many :hospital_labels, through: :hospital_labelings

  validates :name, presence: true,
                   length: { maximum: 99 }
  validates :access, length: { maximum: 99 }
  validates :url, length: { maximum: 99 }
  # validates :address, length: { maximum: 299 }

  # after_validation :geocode, if: :address_changed?
  # geocoded_by :address
end
