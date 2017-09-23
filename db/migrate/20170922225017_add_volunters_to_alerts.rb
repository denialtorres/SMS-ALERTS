class AddVoluntersToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :volunters, :integer
  end
end
