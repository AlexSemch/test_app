class PeoplesController < ApplicationController
  before_filter :signed_in_user


  def new
   # unless signed_in?
     @people = People.new
   # else
      #redirect_to root_path
   # end
  end

  def create
    #@user = User.new(params[:user])
    #@people = People.new(params[:people])
    @people = current_user.create_people(params[:people])

    if @people.save
      flash[:success] = "Save people"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
   # @user = User.find(params[:id])
  end

  def update
     # @user = User.find(params[:id])
  if @people.update_attributes(params[:people])
      # Handle a successful update.
      flash[:success] = "Profile updated"

    else
      render 'edit'
    end
    end

  def show
    @people = People.find(params[:id])
  end

  def destroy
  end

  def index
    @peoples = People.all
     #@peoples = People.paginate(page: params[:page])
  end

end
