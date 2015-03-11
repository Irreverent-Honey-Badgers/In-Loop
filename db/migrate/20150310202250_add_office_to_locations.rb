class AddOfficeToLocations < ActiveRecord::Migration
  def change
        add_column :locations, :doctor_office, :string, after: :doctor_id
  end
end
