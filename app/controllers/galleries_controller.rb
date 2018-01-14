class GalleriesController < ApplicationController
    before_action :authenticate_user!

    def index
      @galleries = Gallery.all
    end
    
    def new
      @gallery = Gallery.new
    end
    
    def create
      @gallery = Gallery.new(gallery_params)
      @gallery.user = current_user

      if @gallery.save
        # 成功
        redirect_to :root
      else
        # 失敗
        render :new, notice: "ERROR: 上傳失敗"
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
        params.require(:gallery).permit(:title, :description, :photo)
    end
end
