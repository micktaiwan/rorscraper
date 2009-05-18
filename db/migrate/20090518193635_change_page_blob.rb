class ChangePageBlob < ActiveRecord::Migration
  def self.up
    change_column :scraps, :page, :binary, :limit => 10.megabyte
  end

  def self.down
    change_column :scraps, :page, :text
  end
end
