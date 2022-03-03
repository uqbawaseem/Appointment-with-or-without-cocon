class Patient < ApplicationRecord
   validates :name, presence: true

   has_many :appointments
   has_many :doctors, through: :appointments, dependent: :destroy
   accepts_nested_attributes_for :appointments
end
