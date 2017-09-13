class StaticPagesController < ApplicationController
  def home
    if logged_in?

      # @bio = current_user.bio.build

      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end