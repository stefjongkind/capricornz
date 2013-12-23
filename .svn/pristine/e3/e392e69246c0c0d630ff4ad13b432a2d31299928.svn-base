class AdminController < ApplicationController

  before_filter :authorize, :set_default_pages
   
  def index
  end

  #--------- CATEGORY ------------

  def edit_category
    @category = Category.find(params[:id], :include=>:pictures) if params[:id]

    if request.post?
      begin
        case params[:commit]
        when 'Save'  
          if @category.update_attributes(params[:category])
            flash[:notice] = 'Category was successfully updated.'
            redirect_to :action => :categories
          else
            render :action => :edit_category
          end
        when 'Create'
          @category = Category.new(params[:category])
          if @category.save
            flash[:notice] = 'Category was successfully created.'
            redirect_to :action => :categories
          else
            flash[:notice] = 'Category failed.'
            render :action => :edit_category
          end
        end  
      rescue ActiveRecord::RecordInvalid => e
        flash[:notice] = 'Oops! Something went wrong.'
        render :action => :edit_category
      end  
    end  
  end
  
  def create_mugshot
    @category = Category.find(params[:id]) if params[:id]
    begin
      @picture = @category.pictures.create(params[:picture])
      @picture.save
      flash[:notice] = 'Image was successfully created.'
      redirect_to :action => :edit_category, :id => @category     
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = 'Image failed.'
      redirect_to :action => :edit_category, :id => @category     
    end
  end
  
  def edit_category_picture
    @picture = Picture.find(params[:id])
    @category = Category.find(params[:category_id])
    if request.post?
      @category = Category.find_by_id(params[:category_id])
      begin
        case params[:commit]
          when 'Save'
            if params[:uploaded_data]  
              redirect_to :create_mugshot, :picture => params[:picture], :id => @category
            else   
              @picture.update_attributes(params[:picture])
              flash[:notice] = 'Image was successfully updated.'
              redirect_to :action => :edit_category, :id => @category     
            end    
        end  
      rescue ActiveRecord::RecordInvalid => e
        flash[:notice] = 'Image failed.'
        render :action => :edit_category_picture
      end
    end  
  end  
  
  
  def delete_category_picture
    @picture = Picture.find(params[:id])
    @category = Category.find(params[:category_id])
    if request.post?
      @picture.destroy
      flash[:notice] = 'Image successfully deleted.'     
      redirect_to :action => :edit_category, :id => @category
    end
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