class AddPre < ActiveRecord::Migration
  def self.up
    add_column :scraps, :pre, :boolean
  end

  def self.down
    remove_column :scraps, :pre, :boolean
  end
end
