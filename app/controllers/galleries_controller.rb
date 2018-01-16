class GalleriesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_gallery, only: [:edit, :update, :destroy, :show]

    def index
      @galleries = Gallery.all
    end
    
    def new
      @gallery = Gallery.new
    end
    
    def create
      @gallery = Gallery.new(gallery_params)
      @gallery.user = current_user

      if @gallery.save && @gallery.valid?
        redirect_to user_galleries_path(current_user)
      else
        if @gallery.photo.url == nil
          redirect_back fallback_location: root_path, notice: "ERROR: Photo can't be blank"
        else
          redirect_back fallback_location: root_path, notice: "ERROR: Upload fail!"
        end
      end
    end

    def edit

    end

    def update
      if @gallery.update(product_params)
        redirect_to user_galleries_path(current_user), notice: "Update success!"
      else
        redirect_back fallback_location: root_path, notice: "ERROR: Update fail!"
      end
    end
    
    def show

    end
    
    def destroy
      if @gallery.destroy
        redirect_to user_galleries_path(current_user), notice: "Delete success!"
      else
        redirect_back fallback_location: root_path, notice: "ERROR: Delete fail!"
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
