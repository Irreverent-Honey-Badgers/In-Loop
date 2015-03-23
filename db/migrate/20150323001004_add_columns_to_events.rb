class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :patient_id, :integer
    add_foreign_key :events, :patients
    add_column :events, :doctor_id, :integer
    add_foreign_key :events, :doctors
  end
end
