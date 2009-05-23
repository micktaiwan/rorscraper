class History < ActiveRecord::Base

  def self.add(scrap_id, value)
    create(:scrap_id=>scrap_id, :scrap=>value) if self.last_value(scrap_id) != value
  end
  
  def self.last_value(scrap_id)
    h = History.find(:first, :select=>"scrap", :conditions=>["scrap_id=?",scrap_id], :order=>"id desc")
    return nil if h == nil
    h.scrap
  end

end
