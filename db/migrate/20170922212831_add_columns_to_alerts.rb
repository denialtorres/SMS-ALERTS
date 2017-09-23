class AddColumnsToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :category_id, :integer
    add_column :alerts, :longitude, :float
    add_column :alerts, :latitude, :float
  end
end
