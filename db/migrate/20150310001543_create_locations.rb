class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :patient, index: true
      t.references :doctor, index: true
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :favorite

      t.timestamps
    end
  end
end
