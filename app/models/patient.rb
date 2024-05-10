class Patient < ApplicationRecord
  require 'csv'

  validates :firstname, :middle_initial, :lastname, :birthdate, :age, :gender, :address_line, :contact_number, presence: true

  belongs_to :user
  has_many :consults, dependent: :destroy
  has_many :physical_examinations, dependent: :destroy

  enum gender: {
    female: 0,
    male: 1
  }


  def fullname
    "#{firstname} #{middle_initial} #{lastname}"
  end

  def self.total_patients_by_address_line(address_line)
    where(address_line: address_line).count
  end

  def self.ransackable_attributes(auth_object = nil)
    ["firstname"]
  end

  def self.to_csv
    attributes = %w{ lastname middle_initial firstname age gender length body_circumference muac head_circumference hip limbs z_score address_line contact_number }
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |patient|
        csv << attributes.map{ |attr| patient.send(attr) }
      end
    end
  end
end
