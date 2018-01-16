class HomeController < ApplicationController


    def index
      @news = Gallery.order(created_at: :desc).first(20)
    end
end
