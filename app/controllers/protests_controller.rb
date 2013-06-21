class ProtestsController < ApplicationController


  def new
    @jtest = Dtest.all
  end

  def create
    @jquestions = Dquestion.where(dtest_id: @jtest.id);
  end

end
