class Patient < ApplicationRecord
    validates :name, presence: true
end
