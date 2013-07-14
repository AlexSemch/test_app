class JquestionsController < ApplicationController
  before_filter :fin_test
  before_filter :signed_in_user
  #filter_resource_access
  def show
    @jquestion = Jquestion.find(params[:id])

  end

  def index
    @tte = time_to_end
    if session[:test_started] == 1
      flash[:error] = "Whis is not wery good!!!"
      redirect_to ball_path
    else
      @jquestions = Jquestion.where(:jtest_id => @jtest.id).paginate(page: params[:page])
      respond_to do |format|
        format.html
        ajax_respond format, :section_id => "page"
      end

    end



  #@jquestions = Jquestion.where(:jtest_id => @jtest.id).paginate(page: params[:page])
  end

  def time_to_end
    if (@dtest.time_exec*60 - (Time.now - (@jtest.created_at).to_time)).to_i >= 0
      ((@dtest.time_exec*60 -  (Time.now - (@jtest.created_at).to_time))/60).to_i.to_s+':'+ ((@dtest.time_exec*60 -  (Time.now - (@jtest.created_at).to_time))%60).to_i.to_s
    else
      '00:00'
    end

  end

  def fin_test
     @jtest = Jtest.find(session[:jtest])
     @dtest = Dtest.find(@jtest.dtest_id)
  end

end
