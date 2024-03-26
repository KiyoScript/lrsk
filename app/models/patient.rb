class Patient < ApplicationRecord
  belongs_to :user
  has_many :consults, dependent: :destroy
  has_many :physical_examinations, dependent: :destroy

  accepts_nested_attributes_for :consults, allow_destroy: true
  accepts_nested_attributes_for :physical_examinations, allow_destroy: true

  enum gender: { prefer_not_to_answer: 0, female: 1, male: 2 }

  store :details, accessors: [ :address, :contact_number ], coder: JSON, prefix: true

  validates :fullname, :birthdate, :age, :gender, :details, presence: true

  scope :tambulilid, -> { where(details: { address: "Brgy. Punta" }) }

  def self.ransackable_attributes(auth_object = nil)
    [ "fullname" ]
  end
end
