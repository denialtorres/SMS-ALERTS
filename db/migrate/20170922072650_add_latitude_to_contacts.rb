class AddLatitudeToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :latitude, :float
  end
end
