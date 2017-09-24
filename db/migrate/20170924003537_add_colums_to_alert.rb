class AddColumsToAlert < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :zone, :string
    add_column :alerts, :state, :string
  end
end
