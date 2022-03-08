class Doctor < ApplicationRecord
  validates :name, :specialization, presence: true, :on => :create

  has_many :appointments
  has_many :patients, through: :appointments, dependent: :destroy
  accepts_nested_attributes_for :appointments, reject_if: :all_blank, allow_destroy: true

  before_save :concatenate_name, :if => :new_record?

  def concatenate_name
     self.name = "Dr.#{name.capitalize}"
  end
end
