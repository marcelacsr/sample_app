class NotificationsController < ApplicationController
  before_action :logged_in_user

  def index
    @notifications = current_user.received_notifications.order(created_at: :desc)
  end

  def create
    @user = User.find(params[:follower_id])
    current_user.send_follow_notification(@user)

    UserMailer.send_notification_email(@user).deliver_now

    flash[:success] = "Notification sent!"
    redirect_to @user
  end


  def destroy
    Notification.find(params[:id]).destroy
    flash[:success] = "Ignored!"
    redirect_to notifications_url
  end

  #
  # def destroy
  #   Relationships.find(params[:id]).destroy
  #   flash[:success] = "Ignored!"
  #   redirect_to notifications_url
  # end
  #
  #
  # private
  #
  # def relationship_params
  #   params.require(:relationship).permit()
  # end


  #
  # def create
  # # Depois de outro user clicar no follow, gera uma notificação
  # end
  # def index
  # @notification = current_user.
  # @notification = Notification.all
  # render 'users/notification'
  #@follow_notification = FollowNotification.all
  # end

  #
  # def show
  #   render template: "users/@follow_notification/#{params[:page]}"
  # end

  # before_action :logged_in_user, only: [:create, :destroy]
  # #
  #   def new
  #     @notification = Notification.new
  #   end
  #
  #   def create
  #     #initialize instance variables that you would use in users/@follow_notification.html.erb
  #     @notification = Notification.new (notification_params)
  #     if @notification.save
  #       redirect_to root_url
  #     else
  #       render 'static_pages/home'
  #     end
  #   end

  #
  #   def destroy
  #   end
  #
  #   def edit
  #
  #   end
  #
  #   def update
  #
  #   end


  # def new
  #   @@follow_notification = FollowNotification.new
  #
  # end
  #
  # def create
  #   @@follow_notification = FollowNotification.new(notification_params)
  #   if @@follow_notification.save
  #     # @user.send_activation_email
  #     # flash[:info] = "Please check your email to activate your account."
  #     flash[:success] = "Nova notificação teste"
  #
  #     redirect_to root_url
  #   else
  #     render 'new'
  #   end
  #
  # end
  # #
  # # def update
  # #   @user = User.find(params[:id])
  # #   if @user.update_attributes(user_params)
  # #     # Handle a successful update.
  # #     flash[:success] = "Profile updated"
  # #
  # #     # if @user.
  # #     #   #Quando atualizar a bio, como exibir mensagens diferentes?
  # #     # flash[:success] = "Bio updated"
  # #     redirect_to @user
  # #
  # #   else
  # #     render 'edit'
  # #   end
  #
  # private
  #
  #  def notification_params
  #    params.require(:notification).permit(:message, :notification_read)
  #  end

  # private
  #
  # def user_params
  #   params.require(:user).permit(:name, :email, :password,
  #                                :password_confirmation, :bio, :avatar)
  # end

end