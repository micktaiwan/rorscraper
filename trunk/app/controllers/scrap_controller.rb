class ScrapController < ApplicationController

  def add
    @scrap = Scrap.new
    render(:partial=>'se')
  end

  def edit
    @scrap = Scrap.find(params['id'])
    render(:partial=>'se')
  end
  
  def post
    id = params['id']
    if id==nil
      scrap = Scrap.new(params['scrap'])
      scrap.user_id = session['user'].id
      scrap.save
    else
      Scrap.find(id).update_attributes(params['scrap'])
    end
    render(:partial=>'scrap', :collection=>session['user'].scraps)
  end
  
  def delete
    Scrap.delete(params['id'])
    render(:nothing=>true)
  end

  def scrap
    id = params['id']
    @scrapd = Scrap.find(id)
    @scrapd.do_scraping!
    render(:partial=>'scrapd')
  end

end

