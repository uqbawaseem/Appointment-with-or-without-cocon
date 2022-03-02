class ChangeDatatypeInAppointment < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :date, :date
  end
end
