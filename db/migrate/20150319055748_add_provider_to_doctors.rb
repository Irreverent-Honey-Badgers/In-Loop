class AddProviderToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :provider, :string
    add_column :doctors, :did, :string
  end
end
