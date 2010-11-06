class PhotosetsController < ApplicationController
  def index
    @photosets = Photoset.all
  end
  
  def show
    @photoset = Photoset.get(params[:id])
    
    respond_to do |format|
      format.html { render :layout => false }
    end
  end
  
  def refresh
    Photoset.all(true)
    redirect_to root_path
  end
end