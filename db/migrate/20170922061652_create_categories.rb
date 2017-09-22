class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :value
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
