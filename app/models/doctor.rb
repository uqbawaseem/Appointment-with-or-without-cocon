class Doctor < ApplicationRecord
    validates :name, :specialization, presence: true, :on => :create
end
