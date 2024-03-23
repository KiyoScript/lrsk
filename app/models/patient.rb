class Patient < ApplicationRecord
  belongs_to :user
  has_many :consults, dependent: :destroy

  enum gender: { prefer_not_to_answer: 0, female: 1, male: 2 }
  store :details, accessors: [ :address  ], coder: JSON, prefix: true

  def self.ransackable_attributes(auth_object = nil)
    [ "fullname" ]
  end
end
