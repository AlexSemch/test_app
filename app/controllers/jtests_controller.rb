class JtestsController < ApplicationController
include JtestsHelper
before_filter :signed_in_user

  def index
    @dtest = Dtest.all
    @jtests = Jtest.order(:dtest_id)
  end

  def index_detal
    @jtests = Jtest.where(dtest_id: params[:sel_dtest])
  end

def new
    @jtest= Jtest.new
    @test_sel = Dtest.all
  end

  def create
    @jtest = Jtest.new(params[:jtest])
    @jtest.student_id = current_student.id
    @jtest.begin_time = Time.zone.now

    @jtest.save



    make_quest(@jtest.id)
  end

  def show
    @jtest = Jtest.find(params[:id])


  end

  def make_quest(idd)
    @jtest = Jtest.find(idd)
    @current_test = Dtest.find(@jtest.dtest_id)
    @quests = Dquestion.find_by_sql(  "select *
      from Dquestions q
      where q.dtest_id = :test_id
      ORDER BY random()
      LIMIT :N", test_id: @current_test.id, N: @current_test.count_test )



    @quests.each do |quest|
      @jtest.jquestions.create!(dquestion_id: quest.id)
    end

    Jquestion.where(:jtest_id => @jtest.id).each do |jquest|

      @answers = Danswer.find_by_sql("select *
      from Danswers
      where dquestion_id = :q_id
      order by random()",q_id: jquest.dquestion_id)

      @answers.each do |ans|
        jquest.janswers.create!(danswer_id: ans.id)
      end
    end

  session[:jtest] = @jtest.id
    redirect_to jquestions_path
    session[:test_started] = 0;

  end

  def end_of_test
    @jtest = Jtest.find(session[:jtest])
    @student = Student.find(@jtest.student_id)
    unless @jtest.end_time
        @jtest.end_time = Time.zone.now
        bal = calculate_ball(@jtest)
        @jtest.ball = bal
        @jtest.save!

        @student.round_ball = (@student.round_ball*@student.count_of_test + bal)/(@student.count_of_test + 1)
        @student.count_of_test += 1
        @student.save!
    else
        flash[:notise] = 'Test finish'

    end
  end



end
