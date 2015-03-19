class Remove < ActiveRecord::Migration
  def change
    remove_column :patients, :eta
  end
end
