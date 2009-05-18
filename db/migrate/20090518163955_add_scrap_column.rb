class AddScrapColumn < ActiveRecord::Migration
  def self.up
    add_column('scraps', 'scrap', 'text')
  end

  def self.down
    remove_column('scraps', 'scrap')
  end
end
