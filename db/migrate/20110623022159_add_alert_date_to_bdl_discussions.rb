class AddAlertDateToBdlDiscussions < ActiveRecord::Migration
  def self.up
    add_column :bdl_discussions, :alert_date, :date
  end

  def self.down
    remove_column :bdl_discussions, :alert_date
  end
end
