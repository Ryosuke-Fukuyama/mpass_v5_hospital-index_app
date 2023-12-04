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

  def self.ransackable_attributes(auth_object = nil)
    %w(name)
  end
  def self.ransackable_associations(auth_object = nil)
    %w(hospital_labels)
  end

  # private_class_method :ransackable_attributes,
  #                      :ransackable_associations
end
