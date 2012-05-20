class NumsController < ApplicationController
    before_filter :signed_in_user 
  before_filter :admin_check 
  
  before_filter :get_sound
  def get_sound
    @sound=Studioname.find(params[:studioname_id])
  end
  def new
    @album = @sound.studio.new
      
     @album.sheres.build
  end
   def edit
    @album = @sound.studio.find(params[:id])
         @album.sheres.build

  end
      def update
    @album = @sound.studio.find(params[:id])

    if @album.update_attributes(params[:studio]) 
    flash[:success] = "Profile updated"
        redirect_to [@sound]
    else
      render 'edit'
    end
  end
      def destroy
    @sound.studio.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to sound_path(@sound)
  end
  def show
     
 @sound1=@sound.studio.paginate(:page => params[:page],:per_page => 3)

      @album = @sound.studio.find(params[:id])
  end
def create
   @album = @sound.studio.new(params[:studio]) 
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
