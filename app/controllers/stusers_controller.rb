class StusersController < ApplicationController
 before_filter :signed_in_user

 def create
  current_user.student = (@student)
  respond_to do |format|
    format.html { redirect_to @student }
    format.js
  end

 end

 def destroy

 end

end