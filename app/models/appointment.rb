class Appointment < ApplicationRecord
  validates :date, :room_no, :doctor_id ,presence: true
  belongs_to :doctor
  belongs_to :patient
end
