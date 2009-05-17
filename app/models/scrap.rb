require 'open-uri'

class Scrap < ActiveRecord::Base
  attr_readonly :page
  
  def do_scraping!
    begin
      open(url, "User-Agent" => "Ruby/#{RUBY_VERSION}",
        "From" => "protask@protaskm.com",
        "Referer" => "http://scraper.protaskm.com/") { |f|
        self.page = f.read
        self.error= ''
        save!
        }
    rescue Exception => e
      self.error = "Scraping failed: "+e.message
      save!
    end
  end

end

