class UsersController < ApplicationController
   before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
   before_filter :correct_user,   only: [:edit, :update]
   before_filter :admin_user,     only: :destroy

   def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    #@microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    unless signed_in?
    @user = User.new
    else
      redirect_to root_path
    end
  end



   def index
    @users = User.paginate(page: params[:page])
  end

  def create
    unless signed_in?
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = t(:welcome)
      redirect_to @user
    else
      render 'new'
    end
    else
      redirect_to root_path
    end
  end

  def edit
   # @user = User.find(params[:id])
  end

    def update
     # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = t(:update)
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
    end

  def destroy
    unless  current_user? User.find(params[:id])
    User.find(params[:id]).destroy
    flash[:success] = t(:user_des)
    redirect_to users_url
    else
      redirect_to root_path
      flash.alert = t(:fna1)
    end
  end



   def make_betta
     ir = rand(1..5)
     redirect_to root_path
     flash.alert = t("fna#{ir}")
   end

   def current_location
     request.fullpath
   end

   def following
     @title = "Following"
     @user = User.find(params[:id])
     @users = @user.followed_users.paginate(page: params[:page])
     render 'show_follow'
   end

   def followers
     @title = "Followers"
     @user = User.find(params[:id])
     @users = @user.followers.paginate(page: params[:page])
     render 'show_follow'
   end

   def add_student
     #@user = current_user;
     current_user.student = (student) #.new(params[:student])
     #redirect_to new_student_path
   end


   private

  

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end



end
