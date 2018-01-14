class GalleryController < ApplicationController
    before_action :authenticate_user!

    def index
      
    end
    
    def new
      @photo = Photo.new
    #   @image = @photo.image.new
    end
    
    def create
      @photo = Photo.new(gallery_params)

      if @photo.save
        # 成功
      else
        # 失敗
        render :new
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
        params.require(:photo).permit(:title, :description, photos_attributes: [:image])
    end
end
