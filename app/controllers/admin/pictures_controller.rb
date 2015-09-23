class Admin::PicturesController < ApplicationController
  before_filter :authorize
  # GET /admin_pictures
  # GET /admin_pictures.xml
  
  layout 'admin'  
 
  # GET /admin_pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
    @category = Category.find(params[:category_id])
  end

 
  # PUT /admin_pictures/1
  # PUT /admin_pictures/1.xml
  def update
    @picture = Picture.find(params[:id])
    @category = Category.find(params[:category_id])
    respond_to do |format|
      begin
        @picture.update_attribute(:position, params[:picture][:position])
        @picture.update_attribute(:description, params[:picture][:description])
        flash[:notice] = 'Picture was successfully updated.'
        format.html { redirect_to :controller => "/admin/categories", :action => :edit_category, :id => @category   }
        format.xml  { head :ok }
      rescue ActiveRecord::RecordInvalid => e
        flash[:notice] = 'Image failed.'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_mugshot
    @category = Category.find(params[:id]) if params[:id]
    begin
      @picture = @category.pictures.create(params[:picture])
      @picture.save
      flash[:notice] = 'Image was successfully created.'
      redirect_to edit_admin_category_path(@category)     
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = 'Image failed.'
      redirect_to edit_admin_category_path(@category)    
    end
  end
  

  # DELETE /admin_pictures/1
  # DELETE /admin_pictures/1.xml
  def destroy
    @picture = Picture.find(params[:id])
    @category = Category.find(params[:category_id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to edit_admin_category_path(@category) }
      format.xml  { head :ok }
    end
  end  
  
end
