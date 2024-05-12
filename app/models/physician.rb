class Physician < ApplicationRecord
  belongs_to :user

  validates :firstname, :middle_initial, :lastname, :gender, :contact_number, presence: true

  enum gender: {
    female: 0,
    male: 1
  }

  def fullname
    "Dr. #{firstname} #{middle_initial} #{lastname}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["lastname"]
  end
end
