class PurchaseNotifyJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    @payments = Payment.where(user_id:user.id , status:false)
    @payments.each do|payment|
      user_book = payment.user_book # recently the user_book is not nil
      notification = Notification.create(body: "#{user.username} buys your #{payment.book_name} book " , recipient_id: user_book.user_id ,user_book_id: nil)
      unseen_notification_number = Notification.where(status:false , recipient_id: user_book.user_id).size
      ActionCable.server.broadcast "notifications:#{user_book.user_id}", html:create_notification(notification) , count: unseen_notification_number
      payment.update(user_book_id:nil , status:true) # payment successfull . ready to display in the payment history
      user_book.destroy # destroy the book
    end
  end
  #recipient_id -> who receive the notification
  #user_book_id -> for which item the notification is going to be pushed
  #user is the current_user
  def create_notification(notification)
    "<div class='alert alert-primary notification-body' role='alert'><%= #{notification.body} %></div>"
  end
end
