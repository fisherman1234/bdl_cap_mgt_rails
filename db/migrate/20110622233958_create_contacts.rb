class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :stock_id
      t.string :job_title
      t.string :name
      t.string :title
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
