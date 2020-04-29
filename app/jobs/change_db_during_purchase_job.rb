class ChangeDbDuringPurchaseJob < ApplicationJob
  queue_as :default

  def perform(current_user) #current_user is not work here untill you pass it manually
    Cart.where(user_id:current_user.id).each do |cart| # for each item transfer to the payment table
      if !Payment.exists?(user_book_id:cart.user_book_id , status:false) #for out of stock condition
        Payment.create(user_id: cart.user_id , book_name:cart.user_book.book_detail.name  , user_book_id: cart.user_book_id) # for now the status is false
      end
      cart.destroy # destroy the cart beacuse already in the another db
    end
  end
end
#Transfer the cart item to the payment process