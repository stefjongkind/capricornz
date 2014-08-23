class PublicController < ActionController::Base

  before_filter :set_default_pages

  
  layout 'application'
  
  def index
    @categories = find_all_categories
    @category = Category.find(:first, :include =>[:pictures]) 
    @pictures = @category.pictures.paginate :page => params[:page], :per_page => 20 , :order => :position
  end

  def find_all_categories
    Category.find(:all, :order => :name)
  end  

  def news_item
    @categories = find_all_categories
    @news_item = News.find(params[:id]) if params[:id]
  end  

  def show_category
    @categories = find_all_categories
    @category = Category.find(params[:id], :include =>[:pictures]) if params[:id]  
    @pictures = @category.pictures.paginate :page => params[:page], :per_page => 20 , :order => :position
  end  


  def find_all_categories
    Category.find(:all, :order => :name)
  end  
  

  private
  
  def set_default_pages
    @page ||= Page.new(
     :page => "", 
     :title => "Rita Scholten, Stef Jongkind, Raffi, Siti and Niwa",
     :section => "Home Page", 
     :stylesheet => ["waiateara"],
     :template => "")
  end   

end