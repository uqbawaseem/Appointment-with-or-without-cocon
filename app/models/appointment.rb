class Appointment < ApplicationRecord
  validates :date, :room_no ,presence: true
  belongs_to :doctor
  belongs_to :patient
end
