class JanswersController < ApplicationController
before_filter :signed_in_user
#filter_resource_access
  def update
    @janswer = Janswer.find(params[:id])
    @janswer.update_attributes(params[:janswer])
  respond_to do |format|
      format.js
  end
  end
end
