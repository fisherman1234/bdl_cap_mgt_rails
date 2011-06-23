class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.string :sector_id
      t.string :sector_analysis_title
      t.text :sector_analysis_text

      t.timestamps
    end
  end

  def self.down
    drop_table :details
  end
end
