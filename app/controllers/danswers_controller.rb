class DanswersController < ApplicationController
  before_filter :get_quest
  before_filter :signed_in_user
  filter_resource_access

  # GET /danswers

  def index
    @danswers = Danswer.where(:dquestion_id => @question.id)

  end

  # GET /danswers/1

  def show
    @danswer = Danswer.find(params[:id])

   
  end

  # GET /danswers/new

  def new
    @danswer = Danswer.new

  end

  # GET /danswers/1/edit
  def edit
    @danswer = Danswer.find(params[:id])
  end

  # POST /danswers

  def create
    @danswer = @question.danswers.new(params[:danswer])

    respond_to do |format|
      if @danswer.save
        format.html { redirect_to danswers_path, notice: t(:created) }
        format.js
        #format.json { render json: @danswer, status: :created, location: @danswer }
      else
        format.html { render action: "new" }
       # format.json { render json: @danswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /danswers/1

  def update
    @danswer = Danswer.find(params[:id])

    respond_to do |format|
      if @danswer.update_attributes(params[:danswer])
        format.html { redirect_to danswers_path, notice: t(:updated) }
        format.js
      else
        format.html { render action: "edit" }
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
