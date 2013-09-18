class DteorsController < ApplicationController
  filter_resource_access
  include DthemsHelper
  # GET /dteors
  # GET /dteors.json
  def index
    @dteors = Dteor.all
   @thems = get_tem
    respond_to do |format|
      if get_tem
        format.html # index.html.erb
        format.json { render json: @dteors }          
      else
        format.html { redirect_to new_student_path, notice: t(:vvedit_dani)}
      end
      
    end
  end

  # GET /dteors/1
  # GET /dteors/1.json
  def show
    @dteor = Dteor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dteor }
    end
  end

  # GET /dteors/new
  # GET /dteors/new.json
  def new
    @dteor = Dteor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dteor }
    end
  end

  # GET /dteors/1/edit
  def edit
    @dteor = Dteor.find(params[:id])
  end

  # POST /dteors
  # POST /dteors.json
  def create
    @dteor = Dteor.new(params[:dteor])

    respond_to do |format|
      if @dteor.save
        format.html { redirect_to @dteor, notice: t(:created) }
        format.json { render json: @dteor, status: :created, location: @dteor }
      else
        format.html { render action: "new" }
        format.json { render json: @dteor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dteors/1
  # PUT /dteors/1.json
  def update
    @dteor = Dteor.find(params[:id])

    respond_to do |format|
      if @dteor.update_attributes(params[:dteor])
        format.html { redirect_to @dteor, notice: t(:updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dteor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dteors/1
  # DELETE /dteors/1.json
  def destroy
    @dteor = Dteor.find(params[:id])
    @dteor.destroy

    respond_to do |format|
      format.html { redirect_to dteors_url }
      format.json { head :no_content }
    end
  end
end
