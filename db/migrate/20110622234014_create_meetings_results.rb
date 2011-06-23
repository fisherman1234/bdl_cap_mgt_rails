class CreateMeetingsResults < ActiveRecord::Migration
  def self.up
    create_table :meetings_results do |t|
      t.integer :stock_id
      t.string :meeting_type
      t.string :meeting_date
      t.string :meeting_contact
      t.integer :bdl_contact
      t.text :meeting_notes
      t.text :meeting_conclusions
      t.string :meeting_object

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings_results
  end
end
