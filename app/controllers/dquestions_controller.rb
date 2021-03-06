class DquestionsController < ApplicationController
  before_filter :fdtest
  before_filter :signed_in_user
  filter_resource_access
  # GET /dquestions
  # GET /dquestions.json
  
  def index
    @dquestions = Dquestion.where(dtest_id: @dtest.id)
   #@dquestions = Dquestion.find_all_by_dtest_id(@dtest.id)

    #respond_to do |format|
    # format.html # index.html.erb
    # format.json { render json:  [@dtest, @dquestion] }
    #end
  end

  # GET /dquestions/1
  # GET /dquestions/1.json
  def show
   
    @dquestion = Dquestion.find(params[:id])
    session[:quest_id] = @dquestion.id
    @danswers = Danswer.where(dquestion_id: @dquestion.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: [@dtest, @dquestion] }
    end
  end

  # GET /dquestions/new
  # GET /dquestions/new.json
  def new
    @dquestion = Dquestion.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @dquestion }
    #end
  end

  # GET /dquestions/1/edit
  def edit
    @dquestion = Dquestion.find(params[:id])
  end

  # POST /dquestions
  # POST /dquestions.json
  def create
   
    @dquestion = @dtest.dquestions.new(params[:dquestion])

    respond_to do |format|
      if @dquestion.save
        # @dquestion.count_answer
        format.html { redirect_to dtest_dquestions_url(@dtest) }
        format.js
      else
       
        format.html { redirect_to dtests_url }
      end

    end
    #(@dquestion.count_answer).times { |i| Danswer.create!(answer_text:  'Answer  '  + i.to_s,  dquestion_id: @dquestion.id)}

  end

  # PUT /dquestions/1
  # PUT /dquestions/1.json
  def update

    @dquestion = Dquestion.find(params[:id])

    respond_to do |format|
      if @dquestion.update_attributes(params[:dquestion])
        format.html { redirect_to [@dtest, @dquestion], notice: t(:updated) }
        format.js
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
      
        format.html { redirect_to dtest_dquestions_url(@dtest) }
        format.js
    end
  end

  def fdtest
     @dtest = Dtest.find(params[:dtest_id])
  end
end
