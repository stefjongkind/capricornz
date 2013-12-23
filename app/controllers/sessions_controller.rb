# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  
  before_filter :authorize, :except => :new_session
  before_filter :set_default_pages
  
  layout 'sessions'

  # render new.rhtml
  def new_session
    if request.post?
      begin
        user = User.authenticate(params[:login], params[:password])
        if user
          session[:user_id] = user.id
          flash[:notice] = "Logged in successfully"
          redirect_to :controller => :admin
        else
          flash[:notice] = "Invalid user/password combination"
          render :action => :new_session
        end 
      rescue Exception => e  
        flash[:notice] = "Something went wrong"
        render :action => :new_session
      end  
    end
  end
  


  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => :new_session)
  end
 

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

  private
  
  def set_default_pages
    @page ||= Page.new(
     :page => "", 
     :title => "Rita Scholten, Stef Jongkind, Raffi, Siti and Niwa",
     :section => "Login", 
     :stylesheet => ["waiateara"],
     :template => "")
  end   
  
end
