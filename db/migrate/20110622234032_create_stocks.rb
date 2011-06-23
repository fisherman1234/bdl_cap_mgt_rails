class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.string :stock_name
      t.integer :sector_id
      t.integer :in_charge
      t.text :environment
      t.text :business_description
      t.text :competition
      t.text :management
      t.integer :is_in_portfolio
      t.text :valorisation
      t.text :investment_case
      t.text :investment_risks_macro
      t.text :investment_risks_micro
      t.string :rating
      t.string :ticker
      t.integer :flagged
      t.integer :flag_date

      t.timestamps
    end
  end

  def self.down
    drop_table :stocks
  end
end
