class Patient < ApplicationRecord
  belongs_to :user
  has_many :consults, dependent: :destroy
  has_many :physical_examinations, dependent: :destroy


  enum gender: {
    prefer_not_to_answer: 0,
    female: 1,
    male: 2
  }

  validates :fullname, :birthdate, :age, :gender, :address_line, :contact_number, presence: true

  def self.total_patients_by_address_line(address_line)
    where(address_line: address_line).count
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "fullname" ]
  end
end
