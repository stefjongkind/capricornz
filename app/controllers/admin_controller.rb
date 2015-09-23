class AdminController < ApplicationController

  before_filter :authorize, :set_default_pages
   
  def index
  end  
  
  def destroy_category
    Category.find(params[:id]).destroy
    flash[:notice] = 'Category was successfully deleted.'
    redirect_to :controller => :admin
  end
  
  #------- USERS ----------
  
  def new_user
    if request.post?
      begin
        @user = User.new(params[:user])
        @user.save!
        flash[:notice] = "Thanks for signing up!"
        redirect_to :controller => 'admin'
      rescue ActiveRecord::RecordInvalid
        render :action => :new_user
      end
    end  
  end
  
  def list_users
    @users = User.find(:all, :order => :login)
  end  

  def activate
    self.current_user = User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.activated?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

# NEWS
 
  def edit_news_item
    @news = News.find(params[:id]) if params[:id]
    if request.post?
      case params[:commit]
      when 'Save'
        if @news.update_attributes(params[:news])
          flash[:notice] = 'News was successfully updated.'
          redirect_to :action => :menu
        else
          render 
        end
      when 'Create'  
        @news = News.new(params[:news])
        if @news.save
          flash[:notice] = 'News item was successfully created.'
          redirect_to :action => :menu
        else
          render 
        end  
      when 'Delete'  
        redirect_to :action => :delete_item, :id => @news
      end  
    end
  end

  def delete_item
    @news = News.find(params[:id]) if params[:id]
    if request.post?
      @news.destroy
      flash[:notice] = 'News item was successfully deleted.'
      redirect_to :action => :menu
    end  
  end

# PRIVATE 
  private
  
  
  def set_default_pages
    @page ||= Page.new(
     :page => "", 
     :title => "Rita Scholten, Stef Jongkind, Raffi, Siti and Niwa",
     :section => "Admin", 
     :stylesheet => ["waiateara"],
     :template => "")
  end   


  def activate
    self.current_user = User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.activated?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end
  

end