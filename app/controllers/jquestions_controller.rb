class JquestionsController < ApplicationController
  before_filter :fin_test

  def show
    @jquestion = Jquestion.find(params[:id])

  end

  def index
    @jquestions = Jquestion.where(:jtest_id => @jtest.id)
  end

  def fin_test
     @jtest = Jtest.find(session[:jtest])
  end

end
