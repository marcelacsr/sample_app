
class RelationshipsController < ApplicationController
  before_action :logged_in_user

  # Adapting the Relationships controller to respond
  # to Ajax involves adding respond_to as above to
  # the create and destroy actions

  def create
    @user = User.find(params[:follower_id])
    current_user.follow(@user)
    # Ajax, which allows web pages
    # to send requests asynchronously
    # to the server without leaving the page
    flash[:success] = " #{@user.name} was accepted!"

    # marcar como lida a notificação

    redirect_to notifications_url

    #not working\/??
    respond_to do |format|
      format.html { redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    #need to arrange the Relationships controller
    #to respond to Ajax requests. We can do this using
    #the respond_to method, responding appropriately
    # depending on the type of request.
    respond_to do |format|
      flash[:success] = "Unfollowed!"
      format.html { redirect_to @user }
      format.js
    end
  end

end