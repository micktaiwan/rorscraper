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

ActiveRecord::Schema.define(:version => 20090523213741) do

  create_table "histories", :force => true do |t|
    t.integer  "scrap_id"
    t.string   "scrap"
    t.datetime "created_at"
  end

  create_table "iptocs", :force => true do |t|
    t.integer "ip_from",       :limit => 8, :null => false
    t.integer "ip_to",         :limit => 8, :null => false
    t.string  "country_code2",              :null => false
    t.string  "country_code3",              :null => false
    t.string  "country_name",               :null => false
  end

  add_index "iptocs", ["ip_from", "ip_to"], :name => "index_iptocs_on_ip_from_and_ip_to", :unique => true

  create_table "rail_stats", :force => true do |t|
    t.string   "remote_ip"
    t.string   "country"
    t.string   "language"
    t.string   "domain"
    t.string   "subdomain"
    t.string   "referer"
    t.string   "resource"
    t.string   "user_agent"
    t.string   "platform"
    t.string   "browser"
    t.string   "version"
    t.datetime "created_at"
    t.date     "created_on"
    t.string   "screen_size"
    t.string   "colors"
    t.string   "java"
    t.string   "java_enabled"
    t.string   "flash"
  end

  add_index "rail_stats", ["subdomain"], :name => "index_rail_stats_on_subdomain"

  create_table "scraps", :force => true do |t|
    t.string    "url",                                                            :null => false
    t.string    "xpath",           :limit => 100,      :default => "/html/title", :null => false
    t.integer   "user_id",                                                        :null => false
    t.binary    "page",            :limit => 16777215
    t.timestamp "updated_at",                                                     :null => false
    t.timestamp "created_at",                                                     :null => false
    t.text      "error"
    t.string    "name",            :limit => 30,                                  :null => false
    t.integer   "public",                              :default => 0,             :null => false
    t.text      "scrap"
    t.datetime  "scrap_time"
    t.boolean   "pre"
    t.text      "last_scrap"
    t.boolean   "email_on_change",                     :default => false
  end

  create_table "search_terms", :force => true do |t|
    t.string  "subdomain",   :default => ""
    t.string  "searchterms", :default => "", :null => false
    t.integer "count",       :default => 0,  :null => false
    t.string  "domain"
  end

  add_index "search_terms", ["subdomain"], :name => "index_search_terms_on_subdomain"

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
