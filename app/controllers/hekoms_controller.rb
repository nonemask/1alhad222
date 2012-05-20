class HekomsController < ApplicationController
    before_filter :signed_in_user, only: [:new, :edit, :update,:destroy]
  before_filter :admin_check, only: [:new, :edit, :update,:destroy]

     def destroy
 Hekom.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to sounds_path
  end
  def index
        @sound = Hekom.paginate(:page => params[:page],:per_page => 3)
  end
def edit
    @sound = Hekom.find(params[:id])
  
  end
  
    def update
    @sound = Hekom.find(params[:id])
    if @sound.update_attributes(params[:hekom])
    flash[:success] = "Profile updated"
      redirect_to @sound 
    else
      render 'edit'
    end
  end
  
  def show

  end
   def create
    @sound = Hekom.new(params[:hekom]) 
    if @sound.save
            flash[:success] = "Welcome to the Sample App!"
      redirect_to @sound
    else
      render 'new'
    end
  end
  
  def new
    @sound = Hekom.new
  
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
