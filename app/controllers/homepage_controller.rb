class HomepageController < ApplicationController
  before_action :authenticate_user!

  def home
    @new_books = UserBook.order("created_at desc").limit(3)
    @top_books = UserBook.where("rating > 0").order("rating desc").limit(3)
  end
  
  def profile
  end

  def notification
    @notifications =  Notification.where(status:false , recipient_id:current_user.id).order("created_at desc")
    @notifications.each do|notification|
      if !notification.status
        notification.update(status:true)
      end
    end
  end

  def all_notification
    @notifications = Notification.where(recipient_id:current_user.id).order("created_at desc")
    render 'loadmore'
  end

  def destroy
    @notification = Notification.find(params[:id])
    authorize @notification
    @notification.destroy if !@notification .nil?
    redirect_to  allnotifications_path
  end

  def notify
    current_user.update(notify:params[:flag])
    redirect_back(fallback_location: root_path)
  end
end
