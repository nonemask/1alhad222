class ImagesController < ApplicationController
    before_filter :signed_in_user, only: [:new, :edit, :update,:destroy]
  before_filter :admin_check, only: [:new, :edit, :update,:destroy,:index,:show]

     def destroy
 Studioname.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to sounds_path
  end
  def index
        @sound = Studioname.paginate(:page => params[:page],:per_page => 3)
  end
def edit
    @sound = Studioname.find(params[:id])
  
  end
  
    def update
    @sound = Studioname.find(params[:id])
    if @sound.update_attributes(params[:studioname])
    flash[:success] = "Profile updated"
      redirect_to @sound 
    else
      render 'edit'
    end
  end
  
  def show
   def download(x)
      send_file x
  end
 @sound = Studioname.find(params[:id])
 @sound1=@sound.studio.paginate(:page => params[:page],:per_page => 3)

  end
   def create
    @sound = Studioname.new(params[:studioname]) 
    if @sound.save
            flash[:success] = "Welcome to the Sample App!"
      redirect_to @sound
    else
      render 'new'
    end
  end
  
  def new
    @sound = Studioname.new
  
  end
    private

    def signed_in_user
      redirect_to  signin_path, notice: "Please sign in." unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || admin_check?
    end
    def admin_check
      redirect_to(root_path) unless  admin_check?
    end
end
