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
        self.scrap = ''
        self.error = 'element not found'
      elsif element.class == Hpricot::Elements
        if(element.size == 0)        
          self.scrap = ''
          self.error = 'element not found'
        else
          self.scrap = element[0].inner_html
          self.error = 'the given xpath returned several elements'
        end
      else
        self.scrap = element.inner_html
        self.error = ''
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

end

