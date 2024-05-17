class Consult < ApplicationRecord
  belongs_to :patient
  validates :reason, presence: true
end
