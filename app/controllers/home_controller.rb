class HomeController < ApplicationController
  
  def index
    @categories = find_all_categories
    @news_items = News.find(:all, :order => 'updated_on DESC')
    @intro = Intro.find(:all).first
  end

  def find_all_categories
    Category.find(:all, :order => :name)
  end  
  
  
end
