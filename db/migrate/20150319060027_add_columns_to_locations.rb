class AddColumnsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :eta, :string
    add_column :locations, :purpose, :text
    add_column :locations, :appointment_time, :datetime
  end
end
