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
    @scraps = Scrap.find(:all, :conditions=>["user_id=?",session['user'].id])
    render(:partial=>'scrap', :collection=>@scraps)
  end
  
  def delete
    Scrap.delete(params['id'])
    render(:text=>'deleted')
  end

  def scrap
    id = params['id']
    @scrap = Scrap.find(id)
    @scrap.do_scraping!
    render(:partial=>'scrap')
  end

  
end
