class AddFlagCommentToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :flag_comment, :string
  end

  def self.down
    remove_column :stocks, :flag_comment
  end
end
