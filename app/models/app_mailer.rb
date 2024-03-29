class AppMailer < ActionMailer::Base
  
  def alert(title, msg)
    @subject    = '[Scraper] ' + title
    @body["msg"] = msg
    @recipients = 'faivrem@gmail.com'
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end

  def scrap(scrap)
    @subject    = "[Scraper] #{scrap.name} changed"
    @body["scrap"] = scrap
    @recipients = scrap.user.email
    @from       = 'protask@protaskm.com'
    @sent_on    = Time.now
    @headers    = {}
  end

end

