# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "scraps", :force => true do |t|
    t.string    "url",                                                  :null => false
    t.string    "xpath",      :limit => 100, :default => "/html/title", :null => false
    t.integer   "user_id",                                              :null => false
    t.text      "page"
    t.timestamp "updated_at",                                           :null => false
    t.timestamp "created_at",                                           :null => false
    t.text      "error"
    t.string    "name",       :limit => 30,                             :null => false
    t.integer   "public",                    :default => 0,             :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "name",       :limit => 30
    t.string    "password",   :limit => 40
    t.string    "email",      :limit => 30, :null => false
    t.string    "lost_key",   :limit => 16
    t.timestamp "last_login",               :null => false
    t.timestamp "created_at",               :null => false
    t.timestamp "updated_at",               :null => false
  end

end
