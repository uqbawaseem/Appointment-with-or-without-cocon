class Patient < ApplicationRecord
    validates :name, presence: true

   has_many :appointments
   has_many :doctors, through: :appointments
end
