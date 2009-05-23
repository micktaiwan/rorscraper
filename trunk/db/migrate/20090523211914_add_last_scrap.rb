class AddLastScrap < ActiveRecord::Migration
  def self.up
    add_column :scraps, :last_scrap, :text
  end

  def self.down
    remove_column :scraps, :last_scrap
  end
end
