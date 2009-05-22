require 'open-uri'
require 'hpricot'

class Scrap < ActiveRecord::Base
  has_many :histories
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
        elsif(element.size == 1)
          save_scrap(element.inner_html, '1 element')
        else
          save_scrap(element[0].inner_html, 'the given xpath returned several elements')
        end
      else
        save_scrap(element.inner_html, 'normal')
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
  
  def save_scrap(value, error)
    value = value.strip
    self.scrap = value
    self.error = error
    set_scrap_time
    History.create(:scrap_id=>self.id, :scrap=>value)
  end

end

