class JanswersController < ApplicationController


  def update
    @janswer = Janswer.find(params[:id])
    @janswer.update_attributes(params[:janswer])
   # respond_to do |format|
    #  format.js
    #end
  end
end
