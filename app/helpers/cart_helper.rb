module CartHelper
  def total_price
    sum =0 
    Cart.where(user:current_user).each do |cart|
      sum = sum + cart.user_book.price
    end
    sum
  end
end
