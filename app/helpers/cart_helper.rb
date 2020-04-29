module CartHelper
  def total_price
    sum =0 
    Cart.where(user:current_user).each do |cart|
      sum = sum + cart.user_book.price if !book_exist_in_payment_mode?(cart.user_book_id) # suppose during the purchase time period if the product is also available in other cart then the price for that product must not be calculated
    end
    sum
  end
end
