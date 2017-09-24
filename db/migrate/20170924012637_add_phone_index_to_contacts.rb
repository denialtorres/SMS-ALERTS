class AddPhoneIndexToContacts < ActiveRecord::Migration
  def change
    add_index :contacts, :phone, unique: true
  end
end
