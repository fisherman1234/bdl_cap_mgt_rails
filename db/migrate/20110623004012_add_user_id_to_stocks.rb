class AddUserIdToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :user_id, :integer
  end

  def self.down
    remove_column :stocks, :user_id
  end
end
