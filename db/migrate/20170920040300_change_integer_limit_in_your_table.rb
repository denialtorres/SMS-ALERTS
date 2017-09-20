class ChangeIntegerLimitInYourTable < ActiveRecord::Migration
  def change
     change_column :contacts, :phone, :integer, limit: 8
  end
end
