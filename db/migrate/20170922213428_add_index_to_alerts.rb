class AddIndexToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_index :alerts, :category_id
  end
end
