class GalleriesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_gallery, only: [:edit, :update, :destroy, :show]

    def index
      @galleries = Gallery.where(user_id: current_user)
    end
    
    def new
      @gallery = Gallery.new
    end
    
    def create
      @gallery = Gallery.new(gallery_params)
      @gallery.user = current_user

      if @gallery.valid? && @gallery.save
        redirect_to user_galleries_path(current_user)
      else
        if @gallery.photo.url == nil
          redirect_back fallback_location: root_path, notice: "ERROR: 無選取相片"
        else
          redirect_back fallback_location: root_path, notice: "ERROR: 上傳失敗!"
        end
      end
    end

    def edit

    end

    def update
      if @gallery.update(product_params)
        redirect_to user_galleries_path(current_user), notice: "更新成功!"
      else
        redirect_back fallback_location: root_path, notice: "ERROR: 更新失敗!"
      end
    end
    
    def show

    end
    
    def destroy
      if @gallery.destroy
        @gallery.remove_photo!
        redirect_to user_galleries_path(current_user), notice: "刪除成功!"
      else
        redirect_back fallback_location: root_path, notice: "ERROR: 刪除失敗!"
      end
    end

    private
    def gallery_params
      @gallery = params.require(:gallery).permit(:title, :description, :photo)
    end

    def find_gallery
      @gallery = Gallery.find_by(id: params[:id])
    end
end
