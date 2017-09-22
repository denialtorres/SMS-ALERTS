class AddAboutYouToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :about_yo, :string
  end
end
