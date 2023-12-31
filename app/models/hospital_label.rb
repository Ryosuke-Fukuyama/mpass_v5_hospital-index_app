class HospitalLabel < ApplicationRecord
  has_many :hospital_labelings
  has_many :hospitals, through: :hospital_labelings

  validates :name, presence: true,
                   uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    super
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end

  # private_class_method :ransackable_attributes
end
