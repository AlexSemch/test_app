class StaticPagesController < ApplicationController
  def home
    if signed_in?
      if current_user.admin
        redirect_to jtests_path
      end
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

  end

  def help
  end

  def  about

  end

  def contact

  end




end
