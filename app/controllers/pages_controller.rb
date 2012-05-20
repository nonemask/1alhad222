
class PagesController < ApplicationController
  def index
        @micropost = Micropost.new if signed_in?
            redirect_to signin_path
  end


  
  def new
    
    @sound = Sound.new
    @sound.asets.build
  end
end
