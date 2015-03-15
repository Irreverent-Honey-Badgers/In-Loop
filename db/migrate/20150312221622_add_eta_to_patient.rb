class AddEtaToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :eta, :string
  end
end
