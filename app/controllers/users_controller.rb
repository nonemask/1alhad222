class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update ,:show]
  before_filter :admin_check, only: [:index]
  before_filter :correct_user, only: [:edit, :update,:show]
  
  def new
    @user = User.new
    
  end
  def index
    @users = User.paginate(:page => params[:page],:per_page => 3)
    
  end
  def show
    @user = User.find(params[:id])
   redirect_to  user_microposts_path(@user)
            @micropost1 = Micropost.new if signed_in?
      @id=params[:id]
       @user = User.find(params[:id])
      @microposts = @user.microposts.paginate(:page => params[:page])
    
    if User.exists?(params[:id])
        @user = User.find(params[:id])
      else
        redirect_back_or(root_path)
      end
  end
 def create
    @user = User.new(params[:user]) 
    if @user.save
      sign_in @user
            flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
    def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
    flash[:success] = "Profile updated"
      redirect_to @user 
    else
      render 'edit'
    end
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
