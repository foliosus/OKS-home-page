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

ActiveRecord::Schema.define(:version => 20110421055953) do

  create_table "addresses", :force => true do |t|
    t.integer  "addressable_id",                                     :null => false
    t.string   "addressable_type", :limit => 20,                     :null => false
    t.string   "address_type",     :limit => 5,  :default => "home", :null => false
    t.boolean  "current",                        :default => true
    t.string   "address",          :limit => 60,                     :null => false
    t.string   "address2",         :limit => 60
    t.string   "city",             :limit => 40,                     :null => false
    t.string   "state",            :limit => 2,                      :null => false
    t.string   "zip",              :limit => 9,                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.integer  "emailable_id",                                     :null => false
    t.string   "emailable_type", :limit => 20,                     :null => false
    t.string   "email_type",     :limit => 5,  :default => "home", :null => false
    t.boolean  "current",                      :default => true
    t.string   "address",        :limit => 80,                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "first_name",        :limit => 40, :null => false
    t.string   "middle_name",       :limit => 40
    t.string   "last_name",         :limit => 40, :null => false
    t.string   "membership_number", :limit => 10, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephones", :force => true do |t|
    t.integer  "telephonable_id",                                   :null => false
    t.string   "telephonable_type", :limit => 20,                   :null => false
    t.string   "telephone_type",    :limit => 5,                    :null => false
    t.boolean  "current",                         :default => true
    t.string   "area_code",         :limit => 3,                    :null => false
    t.string   "number",            :limit => 7,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
