class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  
  before_filter :set_default_page
  before_filter :instantiate_controller_and_action_names

  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end
  
  def picture
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
    :filename => @picture.name,
    :type => @picture.content_type,
    :disposition => "inline" )
  end

  def get_image
    @picture = Picture.new
  end
  
  private

  def authorize
    unless User.find_by_id(session[:user_id])
#      flash[:notice] = "Please log in"
      redirect_to(:controller => "sessions", :action => :new_session)
    end
  end

  def set_default_page
    @page ||= Page.new(
     :page => "", 
     :title => "Rita Scholten, Stef Jongkind, Raffi, Siti and Niwa",
     :section => "", 
     :stylesheet => ["waiateara"],
     :template => ""
    )
  end

end
