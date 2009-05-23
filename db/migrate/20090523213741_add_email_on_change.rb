class AddEmailOnChange < ActiveRecord::Migration
  def self.up
    add_column :scraps, :email_on_change, :boolean, :default=>false
  end

  def self.down
    remove_column :scraps, :email_on_change
  end
end
