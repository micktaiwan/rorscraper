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
      element = (doc/self.xpath)
      if element.class == Array
        self.scrap = element.first.inner_html
        self.error = 'the given xpath returned several elements'
      else
        self.scrap = element.inner_html
        self.error= ''
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

