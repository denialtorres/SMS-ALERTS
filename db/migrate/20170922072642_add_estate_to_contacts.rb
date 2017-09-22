class AddEstateToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :estate, :string
  end
end
