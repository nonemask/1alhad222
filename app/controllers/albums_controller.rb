class AlbumsController < ApplicationController
    before_filter :signed_in_user 
  before_filter :admin_check 
  
  before_filter :get_sound
  def get_sound
    @sound=Sound.find(params[:sound_id])
  end
  def new
    @album = @sound.lists.new
      
     @album.asetts.build
  end
   def edit
    @album = @sound.lists.find(params[:id])
         @album.asetts.build

  end
      def update
    @album = @sound.lists.find(params[:id])

    if @album.update_attributes(params[:list]) 
    flash[:success] = "Profile updated"
        redirect_to [@sound]
    else
      render 'edit'
    end
  end
      def destroy
    @sound.lists.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to sound_path(@sound)
  end
  def show
        @sound=Sound.find(params[:sound_id])
 @sound1=@sound.lists.paginate(:page => params[:page],:per_page => 3)

      @album = @sound.lists.find(params[:id])
  end
def create
   @album = @sound.lists.new(params[:list]) 
    if @album.save

            flash[:success] = "Welcome to the Sample App!"
      redirect_to [@sound]
    else
      
      render 'new'
    end
end
  def index
  end
     private

    def signed_in_user
      redirect_to  signin_path, notice: "Please sign in." unless signed_in?
    end
    def admin_check
      redirect_to(root_path) unless  admin_check?
    end
end
