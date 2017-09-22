class Categorization < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :category_id
      t.integer :contact_id
      
      t.timestamps
    end  
  end
end