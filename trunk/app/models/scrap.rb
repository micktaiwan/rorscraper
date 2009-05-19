require 'open-uri'
require 'hpricot'

class Scrap < ActiveRecord::Base
  before_save :before
  
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
        else
          self.scrap = element[0].inner_html
          self.error = 'the given xpath returned several elements'
          set_scrap_time
        end
      else
        self.scrap = element.inner_html
        self.error = ''
        set_scrap_time
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
  
  def set_scrap_time
    self.scrap_time = Time.now
  end

end

