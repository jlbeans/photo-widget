class StaticPagesController < ApplicationController

def index
  begin
    require 'flickr'
    flickr = Flickr.new
    if params[:user_id].present?
      @photos = flickr.photos.search(user_id: params[:user_id])
    else
      @photos = flickr.photos.getRecent
    end
  rescue StandardError => e
    flash[:alert] = "#{e.class}: #{e.message}. Something went wrong.."
    redirect_to root_path
  end
 end
end
