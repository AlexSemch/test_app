class DquestionsController < ApplicationController
  # GET /dquestions
  # GET /dquestions.json
  def index
    @dquestions = Dquestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dquestions }
    end
  end

  # GET /dquestions/1
  # GET /dquestions/1.json
  def show
    @dquestion = Dquestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dquestion }
    end
  end

  # GET /dquestions/new
  # GET /dquestions/new.json
  def new
    @dquestion = Dquestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dquestion }
    end
  end

  # GET /dquestions/1/edit
  def edit
    @dquestion = Dquestion.find(params[:id])
  end

  # POST /dquestions
  # POST /dquestions.json
  def create
    @dtest = Dtest.find(params[:dtest_id])
    @dquestion = @dtest.Dquestion.new(params[:dquestion])

    respond_to do |format|
      if @dquestion.save
        format.html { redirect_to @dquestion, notice: 'Dquestion was successfully created.' }
        format.json { render json: @dquestion, status: :created, location: @dquestion }
      else
        format.html { render action: "new" }
        format.json { render json: @dquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dquestions/1
  # PUT /dquestions/1.json
  def update
    @dquestion = Dquestion.find(params[:id])

    respond_to do |format|
      if @dquestion.update_attributes(params[:dquestion])
        format.html { redirect_to @dquestion, notice: 'Dquestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dquestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dquestions/1
  # DELETE /dquestions/1.json
  def destroy
    @dquestion = Dquestion.find(params[:id])
    @dquestion.destroy

    respond_to do |format|
      format.html { redirect_to dquestions_url }
      format.json { head :no_content }
    end
  end
end
