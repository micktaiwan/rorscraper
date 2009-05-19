class AddScrapTime < ActiveRecord::Migration
  def self.up
    add_column :scraps, :scrap_time, :timestamp
  end

  def self.down
    remove_column :scraps, :scrap_time
  end
end
