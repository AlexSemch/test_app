class JquestionsController < ApplicationController
  before_filter :fin_test
before_filter :signed_in_user
  def show
    @jquestion = Jquestion.find(params[:id])

  end

  def index
   @jquestions = Jquestion.where(:jtest_id => @jtest.id).paginate(page: params[:page])
  #@jquestions = Jquestion.where(:jtest_id => @jtest.id).paginate(page: params[:page])
  end

  def fin_test
     @jtest = Jtest.find(session[:jtest])
  end

end
