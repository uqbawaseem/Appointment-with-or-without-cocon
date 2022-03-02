class Doctor < ApplicationRecord
    validates :name, :specialization, presence: true, :on => :create
  has_many :appointments
  has_many :patients, through: :appointments
end
