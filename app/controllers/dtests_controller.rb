class DtestsController < ApplicationController
  # GET /dtests
  # GET /dtests.json
  def index

    @dtests = Dtest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dtests }
    end
  end

  # GET /dtests/1
  # GET /dtests/1.json
  def show
    @dtest = Dtest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dtest }
    end
  end

  # GET /dtests/new
  # GET /dtests/new.json
  def new
    @dtest = Dtest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dtest }
    end
  end

 

  # POST /dtests
  # POST /dtests.json
  def create
    @dtest = Dtest.new(params[:dtest])

    respond_to do |format|
      if @dtest.save
        format.html { redirect_to @dtest, notice: t(:notise_test) }
        format.json { render json: @dtest, status: :created, location: @dtest }
      else
        format.html { render action: "new" }
        format.json { render json: @dtest.errors, status: :unprocessable_entity }
      end
    end
  end



 # GET /dtests/1/edit
  def edit
    @dtest = Dtest.find(params[:id])
  end


  #---------------------------------------------------
  #def add_question
   # session[:test_ids] = params[:dtest_id]
  #  render :template => "dquestions/new"
    #@dtest = Dtest.find(params[:id])
  #end


  #________________________________________________
  # PUT /dtests/1
  # PUT /dtests/1.json
  def update
    @dtest = Dtest.find(params[:id])

    respond_to do |format|
      if @dtest.update_attributes(params[:dtest])
        format.html { redirect_to @dtest, notice: t(:upd_test)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dtests/1
  # DELETE /dtests/1.json
  def destroy
    @dtest = Dtest.find(params[:id])
    @dtest.destroy

    respond_to do |format|
      format.html { redirect_to dtests_url, notice: t(:dest_test) }
      format.json { head :no_content }
    end
  end
end
