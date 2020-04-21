class HomepageController < ApplicationController
  before_action :authenticate_user!

  def home
    @new_books = UserBook.order("created_at desc").limit(3)
    @top_books = UserBook.where("rating > 0").order("rating desc").limit(3)
    render 'home' and return if @top_books.size == 3
    @top_books = UserBook.where("rating > 0").order("rating desc").limit(2)
    render 'home' and return if  @top_books.size == 2
    @top_books = UserBook.where("rating > 0").order("rating desc").limit(1)
  end
  
  def profile
  end

  def notification
    @notifications =  Notification.where(status:false , recipient_id:current_user.id).order("created_at desc")
  end

  def all_notification
    @notifications = Notification.all.order("created_at desc")
    @notifications.each do|notification|
      if !notification.status
        notification.status = true
        notification.save
      end
    end
    render 'loadmore'
  end

  def destroy
    @notification = Notification.find_by(params[:id])
    @notification.destroy
    redirect_to  allnotifications_path
  end

end
