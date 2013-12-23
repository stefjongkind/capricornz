class IntrosController < ApplicationController
  before_filter :authorize, :set_default_pages
  
  layout 'admin'
  
  # GET /intros
  # GET /intros.xml
  def index
    @intros = Intro.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @intros }
    end
  end

  # GET /intros/1
  # GET /intros/1.xml
  def show
    @intro = Intro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @intro }
    end
  end

  # GET /intros/new
  # GET /intros/new.xml
  def new
    @intro = Intro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @intro }
    end
  end

  # GET /intros/1/edit
  def edit
    @intro = Intro.find(params[:id])
    if request.post?
      begin
        @intro.save
      rescue
        flash[:notice] = 'Update failed.'
      end
    end
  end

  # POST /intros
  # POST /intros.xml
  def create
    @intro = Intro.new(params[:intro])

    respond_to do |format|
      if @intro.save
        flash[:notice] = 'Intro was successfully created.'
        format.html { redirect_to(@intro) }
        format.xml  { render :xml => @intro, :status => :created, :location => @intro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @intro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /intros/1
  # PUT /intros/1.xml
  def update
    @intro = Intro.find(params[:id])

    respond_to do |format|
      if @intro.update_attributes(params[:intro])
        flash[:notice] = 'Intro was successfully updated.'
        format.html { redirect_to(@intro) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @intro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /intros/1
  # DELETE /intros/1.xml
  def destroy
    @intro = Intro.find(params[:id])
    @intro.destroy

    respond_to do |format|
      format.html { redirect_to(intros_url) }
      format.xml  { head :ok }
    end
  end
end

private


def set_default_pages
  @page ||= Page.new(
   :page => "", 
   :title => "Rita Scholten, Stef Jongkind, Raffi, Siti and Niwa",
   :section => "Admin", 
   :stylesheet => ["waiateara"],
   :template => "")
end   

