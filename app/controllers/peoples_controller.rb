class PeoplesController < ApplicationController
#  before_filter :signed_in_user


  def new
     @people = People.new
  end

  def create
    @people = People.new(params[:people])
     @people.save
  end

  def show
    @people = People.find(params[:id])
  end

  def destroy
  end

  def index
    @peoples = People.paginate(page: params[:page])
  end

end
