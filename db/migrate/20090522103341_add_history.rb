class AddHistory < ActiveRecord::Migration
  def self.up
  create_table "histories" do |t|
    t.column "scrap_id",   :integer
    t.column "scrap",      :string
    t.column "created_at", :timestamp
  end


  end

  def self.down
    drop_table "histories"
  end
end
