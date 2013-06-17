class DanswersController < ApplicationController
  before_filter :get_quest
  # GET /danswers
  # GET /danswers.json
  def index
    @danswers = Danswer.where(:dquestion_id => @question.id)

  end

  # GET /danswers/1
  # GET /danswers/1.json
  def show
    @danswer = Danswer.find(params[:id])

   
  end

  # GET /danswers/new
  # GET /danswers/new.json
  def new
    @danswer = Danswer.new

  end

  # GET /danswers/1/edit
  def edit
    @danswer = Danswer.find(params[:id])
  end

  # POST /danswers
  # POST /danswers.json
  def create
    @danswer = @question.danswers.new(params[:danswer])

    respond_to do |format|
      if @danswer.save
        format.html { redirect_to danswers_path, notice: 'Danswer was successfully created.' }
        format.js
        #format.json { render json: @danswer, status: :created, location: @danswer }
      else
        format.html { render action: "new" }
       # format.json { render json: @danswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /danswers/1
  # PUT /danswers/1.json
  def update
    @danswer = Danswer.find(params[:id])

    respond_to do |format|
      if @danswer.update_attributes(params[:danswer])
        format.html { redirect_to danswers_path, notice: 'Danswer was successfully updated.' }
        format.js
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
      # format.json { render json: @danswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /danswers/1
  # DELETE /danswers/1.json
  def destroy
    @danswer = Danswer.find(params[:id])
    @danswer.destroy

    respond_to do |format|
      format.html { redirect_to danswers_url }
      format.js
     # format.json { head :no_content }
    end
  end


  def get_quest
      @question = Dquestion.find(session[:quest_id])
  end

end
