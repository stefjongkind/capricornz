class PublicController < ActionController::Base

  before_filter :set_default_pages

  
  layout 'application'
  
  def index
    @categories = find_all_categories
    @category = Category.find(:last, :include =>[:pictures]) 
    @intro = Intro.find(:last)
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

  def contact
    @email = params[:email] if params[:email]
    @message = params[:msg] if params[:msg]
    @name = params[:name] if params[:name]
    if request.post?    
      unless (@email.blank? or @name.blank? or @message.blank?)
        if emails_are_valid?(@email)
          if Notification.deliver_enquiry_notification(@email, @name, @message)
           flash[:notice] = "Thanks, #{@name} for your enquiry. We will get back to you as soon as possible"
           redirect_to :action => :contact, :anchor => 'errorExplanation'
          end
        else
          flash.now[:notice] = "Given email address doesn't appear to be valid"
          render :action => :contact, :anchor => 'errorExplanation'
        end
      else
        flash.now[:notice] = "Please, enter details in all fields"
        render :action => :contact, :anchor => 'errorExplanation'
      end
    end
  end


  def find_all_categories
    Category.find(:all, :order => :name)
  end  
  

  private

  def emails_are_valid?(emails)
       regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
       !!emails.match(regex)
  end
 
  
  def set_default_pages
    @page ||= Page.new(
     :page => "", 
     :title => "Rita Scholten, Stef Jongkind, Raffi, Siti and Niwa",
     :section => "Home Page", 
     :stylesheet => ["waiateara"],
     :template => "")
  end   

end