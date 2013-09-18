class DthemsController < ApplicationController
  before_filter :signed_in_user
  filter_resource_access
  include DthemsHelper
  # GET /dthems
  # GET /dthems.json
  def index
    @dthems = get_tem

    respond_to do |format|
      if get_tem
        format.html # index.html.erb
        format.json { render json: @dthems }
      else
        format.html { redirect_to new_student_path, notice: t(:vvedit_dani)}
      end
    end
  end

  # GET /dthems/1.json
  def show
    @dthem = Dthem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dthem }
    end
  end

  # GET /dthems/new
  # GET /dthems/new.json
  def new
    @dthem = Dthem.new

    #respond_to do |format|
     # format.html # new.html.erb
     # format.json { render json: @dthem }
    #end
  end

  # GET /dthems/1/edit
  def edit
    @dthem = Dthem.find(params[:id])
  end

  # POST /dthems
  # POST /dthems.json
  def create
    @dthem = Dthem.new(params[:dthem])

    respond_to do |format|
      if @dthem.save
        format.html { redirect_to dthems_path, notice: t(:created)}
        #format.json { render json: @dthem, status: :created, location: @dthem }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @dthem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dthems/1
  # PUT /dthems/1.json
  def update
    @dthem = Dthem.find(params[:id])

    respond_to do |format|
      if @dthem.update_attributes(params[:dthem])
        format.html { redirect_to @dthem, notice: t(:updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dthem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dthems/1
  # DELETE /dthems/1.json
  def destroy
    @dthem = Dthem.find(params[:id])
    @dthem.destroy

    respond_to do |format|
    format.html { redirect_to dthems_url }
    format.js
    end
  end
end
