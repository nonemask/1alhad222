class SoundsController < ApplicationController
    before_filter :signed_in_user, only: [:index,:new, :edit, :update,:destroy]
  before_filter :admin_check, only: [:new, :edit, :update,:destroy]
  
     def destroy
 Sound.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to sounds_path
params[:id]  end
  def index
        @sound = Sound.paginate(:page => params[:page],:per_page => 5)
  end
def edit
   @sound = Sound.find(params[:id])
   @sound.asets.build
  end
  
    def update
    @sound = Sound.find(params[:id])
    if @sound.update_attributes(params[:sound])
    flash[:success] = "Profile updated"
      redirect_to @sound 
    else
      render 'edit'
    end
  end
 
  def show


      if Sound.exists?(params[:id]) 
     @sound = Sound.find(params[:id])
           @sound1=@sound.lists.paginate(:page => params[:page],:per_page => 5)

    else
      redirect_to root_path
    
end
  end
   def create
    @sound = Sound.new(params[:sound]) 
    if @sound.save

            flash[:success] = "Welcome to the Sample App!"
      redirect_to @sound
    else
      render 'new'
    end
  end
  
  def new
    @sound = Sound.new
    @sound.asets.build
  end
    private
 def nonnegative_float?
    !!match(/\A\+?\d+(?:\.\d+)?\Z/)
  end
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
