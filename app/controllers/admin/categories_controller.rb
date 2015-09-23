class Admin::CategoriesController < ApplicationController
  before_filter :authorize
  # GET /admin_categories
  # GET /admin_categories.xml
  
  layout 'admin'
  
  def index
    @categories = Category.roots

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  def restructure
      _parent = Category.find(params[:category_id].gsub('category_',''))
      _child = Category.find(params[:subcategory_id].gsub('category_',''))
      _child.move_to_child_of(_parent)
      _child.update_depth
      @categories = Category.roots
      render :partial => 'categories_tree'
  end

  # GET /admin_categories/1
  # GET /admin_categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /admin_categories/new
  # GET /admin_categories/new.xml
  def new
    @category = Category.new
    if request.post?
      @category = Category.new(params[:category])
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        redirect_to :action => :edit, :id => @category
      end
    end
  end

  # GET /admin_categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /admin_categories
  # POST /admin_categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to(@category) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_categories/1
  # PUT /admin_categories/1.xml
  def update
    @category = Category.find(params[:id]) if params[:id]
    respond_to do |format|
      begin 
        @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to admin_categories_path }
        format.xml  { head :ok }
      rescue ActiveRecord::RecordInvalid => e
        flash[:notice] = 'Update failed.'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_categories/1
  # DELETE /admin_categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_categories_url) }
      format.xml  { head :ok }
    end
  end
  
  

end
