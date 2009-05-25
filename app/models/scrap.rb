require 'open-uri'
require 'hpricot'

class Scrap < ActiveRecord::Base
  has_many :histories,  :dependent => :destroy
  before_save :before
  belongs_to :user
  
  def last_value
    
  end
  
  def do_scraping!
    begin
      open(url, "User-Agent" => "Ruby/#{RUBY_VERSION}",
        "From" => "protask@protaskm.com",
        "Referer" => "http://scraper.protaskm.com/") { |f|
        self.page = f.read
        }
      doc = Hpricot(self.page)
      element = doc.search(self.xpath)
      if element == nil
        set_not_found
      elsif element.class == Hpricot::Elements
        if(element.size == 0)        
          set_not_found
        elsif(element.size == 1)
          add_scrap(element.inner_html, '')
        else
          add_scrap(element[0].inner_html, 'the given xpath returned several elements')
        end
      else # should not happen
        add_scrap(element.inner_html, 'element.class != Hpricot:Elements')
      end
      save!
    rescue Exception => e
      self.error = "Scraping failed: "+e.message
      save!
    end
  end
  
private
  
  def before
    self.url = "http://"+self.url if self.url[0..6] != "http://"
  end
  
  def set_not_found
    self.scrap = ''
    self.error = 'element not found'
  end
  
  def add_scrap(value, error)
    value = value.strip
    self.last_scrap = self.scrap
    if(value.size >= 64*1024)
      self.scrap = 'scrap too big (> 64KB)'
    else
      self.scrap = value
    end 
    self.error = error
    self.scrap_time = Time.now
    History.create(:scrap_id=>self.id, :scrap=>value) if self.scrap != self.last_scrap
  end

end

