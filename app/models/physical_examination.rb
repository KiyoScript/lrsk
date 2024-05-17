class PhysicalExamination < ApplicationRecord
  belongs_to :patient
  validates :others, :diagnosis, :district_physician, :plan, presence: true
end
