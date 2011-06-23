class CreateBdlDiscussions < ActiveRecord::Migration
  def self.up
    create_table :bdl_discussions do |t|
      t.date :discussion_date
      t.integer :stock_id
      t.text :view_bdl
      t.integer :alert_bdl
      t.string :stock_price
      t.string :position_bdl

      t.timestamps
    end
  end

  def self.down
    drop_table :bdl_discussions
  end
end
