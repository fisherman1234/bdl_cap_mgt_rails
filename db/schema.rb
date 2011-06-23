# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110623034101) do

  create_table "BDL_Discussions2", :primary_key => "Discussion_ID", :force => true do |t|
    t.date    "Discussion_Date"
    t.integer "Stock_ID",                              :null => false
    t.text    "View_BDL",        :limit => 2147483647
    t.boolean "Alert_BDL",                             :null => false
    t.date    "Alert_Date"
    t.text    "Stock_Price"
    t.string  "Position_BDL",    :limit => 20
  end

  add_index "BDL_Discussions2", ["View_BDL", "Position_BDL"], :name => "View_BDL"

  create_table "Contact2", :primary_key => "Contact_ID", :force => true do |t|
    t.integer "Stock_ID",                 :null => false
    t.string  "Job_Title", :limit => 60
    t.string  "Name",      :limit => 200
    t.string  "Title",     :limit => 200
    t.string  "Email",     :limit => 200
    t.string  "Telephone", :limit => 200
  end

  add_index "Contact2", ["Job_Title", "Name", "Title", "Email", "Telephone"], :name => "Job_Title"

  create_table "Details2", :primary_key => "Detail_ID", :force => true do |t|
    t.integer "Sector_ID",                                   :null => false
    t.date    "Last_Entry_Date"
    t.string  "Sector_Analysis_Title", :limit => 200
    t.text    "Sector_Analysis_Text",  :limit => 2147483647
  end

  add_index "Details2", ["Sector_Analysis_Title", "Sector_Analysis_Text"], :name => "Sector_Analysis_Title"

  create_table "Meetings_Results2", :primary_key => "Meeting_ID", :force => true do |t|
    t.integer "Stock_ID",                                  :null => false
    t.string  "Meeting_Type",        :limit => 30
    t.date    "Meeting_Date"
    t.string  "Meeting_Contact",     :limit => 200
    t.integer "BDL_Contact"
    t.text    "Meeting_Notes",       :limit => 2147483647
    t.text    "Meeting_Conclusions", :limit => 2147483647
    t.text    "Meeting_Object"
  end

  add_index "Meetings_Results2", ["Meeting_Contact", "Meeting_Notes", "Meeting_Conclusions"], :name => "Meeting_Contact"
  add_index "Meetings_Results2", ["Meeting_Contact", "Meeting_Notes", "Meeting_Conclusions"], :name => "Meeting_Contact_2"
  add_index "Meetings_Results2", ["Meeting_Contact", "Meeting_Notes", "Meeting_Conclusions"], :name => "Meeting_Contact_3"

  create_table "Sectors2", :primary_key => "Sector_ID", :force => true do |t|
    t.string "Sector_Name", :limit => 60, :null => false
  end

  create_table "Stocks2", :primary_key => "Stock_ID", :force => true do |t|
    t.string    "Stock_Name",             :limit => 30,                        :null => false
    t.integer   "Sector_ID",                                    :default => 1, :null => false
    t.integer   "In_Charge",                                                   :null => false
    t.text      "Environment",            :limit => 2147483647,                :null => false
    t.text      "Business_Description",   :limit => 2147483647,                :null => false
    t.text      "Competition",            :limit => 2147483647,                :null => false
    t.text      "Management",             :limit => 2147483647,                :null => false
    t.boolean   "Is_In_Portfolio",                                             :null => false
    t.string    "Valorisation",           :limit => 500,                       :null => false
    t.text      "Investment_Case",        :limit => 2147483647,                :null => false
    t.text      "Investment_Risks_Macro", :limit => 2147483647,                :null => false
    t.text      "Investment_Risks_Micro", :limit => 2147483647,                :null => false
    t.string    "Rating",                 :limit => 20,                        :null => false
    t.string    "Ticker",                 :limit => 30
    t.timestamp "Last_Modified",                                               :null => false
    t.string    "Flagged",                :limit => 1
    t.date      "Flag_Date"
  end

  add_index "Stocks2", ["Stock_Name", "Environment", "Business_Description", "Competition", "Management", "Investment_Case", "Investment_Risks_Macro", "Investment_Risks_Micro"], :name => "Stock_Name"

  create_table "bdl_discussions", :force => true do |t|
    t.date     "discussion_date"
    t.integer  "stock_id"
    t.text     "view_bdl"
    t.integer  "alert_bdl"
    t.string   "stock_price"
    t.string   "position_bdl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "alert_date"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "stock_id"
    t.string   "job_title"
    t.string   "name"
    t.string   "title"
    t.string   "email"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", :force => true do |t|
    t.string   "sector_id"
    t.string   "sector_analysis_title"
    t.text     "sector_analysis_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings_results", :force => true do |t|
    t.integer  "stock_id"
    t.string   "meeting_type"
    t.string   "meeting_date"
    t.string   "meeting_contact"
    t.integer  "bdl_contact"
    t.text     "meeting_notes"
    t.text     "meeting_conclusions"
    t.string   "meeting_object"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", :force => true do |t|
    t.string   "sector_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stocks", :force => true do |t|
    t.string   "stock_name"
    t.integer  "sector_id"
    t.integer  "in_charge"
    t.text     "environment"
    t.text     "business_description"
    t.text     "competition"
    t.text     "management"
    t.integer  "is_in_portfolio"
    t.text     "valorisation"
    t.text     "investment_case"
    t.text     "investment_risks_macro"
    t.text     "investment_risks_micro"
    t.string   "rating"
    t.string   "ticker"
    t.integer  "flagged"
    t.date     "flag_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nom"
    t.string   "initiales"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
