class JquestionsController < ApplicationController
  before_filter :fin_test
before_filter :signed_in_user
  def show
    @jquestion = Jquestion.find(params[:id])

  end

  def index

    if session[:test_started] == 1
      flash[:error] = "Whis is not wery good!!!"
      redirect_to ball_path
    else
      @jquestions = Jquestion.where(:jtest_id => @jtest.id).paginate(page: params[:page])
    end
  # session[:test_started] = 1;
  #@jquestions = Jquestion.where(:jtest_id => @jtest.id).paginate(page: params[:page])
  end

  def fin_test
     @jtest = Jtest.find(session[:jtest])
     @dtest = Dtest.find(@jtest.dtest_id)
  end

end
