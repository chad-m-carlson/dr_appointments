class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.sort_by_name
    Patient.order(:first_name)
  end
end
