class AddColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :provider, :string
    add_column :patients, :pid, :string
  end
end
