class GalleriesController < ApplicationController
    before_action :authenticate_user!

    def index
      
    end
    
    def new
      @gallery = Gallery.new
      @photo = @gallery.photos.new
    end
    
    def create
      params = gallery_params
      @gallery = Gallery.new(params)
      @gallery.user = current_user
      @gallery.photos = @photo
      p @gallery
      if @gallery.save
        # 成功
        
      else
        # 失敗
        render :new, notice: "失敗"
      end
    end
    
    def edit
      
    end
    
    def update
      
    end
    
    def show

    end
    
    def destroy
      
    end

    private
    def gallery_params
        params.require(:gallery).permit(:title, :description, photos_attributes: [:image])
    end
end
