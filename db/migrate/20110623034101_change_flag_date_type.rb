class ChangeFlagDateType < ActiveRecord::Migration
  def self.up
    change_column :stocks, :flag_date, :date
  end

  def self.down
  end
end
