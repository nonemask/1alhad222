class MicropostsController < ApplicationController
    before_filter :signed_in_user
  before_filter :admin_check, only: [:admin,:show,:destroy]
  before_filter :correct_user

  before_filter :get_micro 
  def get_micro
  @user = User.find(params[:user_id])
  end
  def admin
          @microposts = Micropost.paginate(:page => params[:page],:per_page => 6)

  end
  def index
    
      @microposts = @user.microposts.paginate(:page => params[:page],:per_page => 4)
      @micropost = User.find(params[:user_id]).microposts.build if signed_in?

    if User.exists?(params[:user_id])
        @user = User.find(params[:user_id])
      else
        redirect_back_or(root_path)
      end
  
  end
  def new
       @microposts = @user.microposts.paginate(:page => params[:page],:per_page => 4)
   
    if User.exists?(params[:user_id])
        @user = User.find(params[:user_id])
      else
        redirect_back_or(root_path)
      end
           @micropost = User.find(params[:user_id]).microposts.build if signed_in?
           
  end
  def show
          @micropost1 = User.find(params[:user_id]).microposts.create if signed_in?
          
    
  end
      def destroy
        
    @user.microposts.find(params[:id]).destroy
    
    @user.feeds.find_by_micropost_id(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to user_microposts_path(@user)
  end
  
   def create
     if admin_check?
          @micropost  = @user.microposts.create(params[:micropost]) 
     else
         @micropost  = current_user.microposts.create(params[:micropost])  
     end
  
    if @micropost.save
          flash[:success] = "Profile updated"
          redirect_to user_microposts_path(@user)
    else
          flash[:error] = ""
          redirect_to user_microposts_path(@user)
    end
  end

    private
  def signed_in_user
      redirect_to  signin_path, notice: "Please sign in." unless signed_in?
    end
    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_path) unless current_user?(@user) || admin_check?
    end
    def admin_check
      redirect_to(root_path) unless  admin_check?
    end
    
end