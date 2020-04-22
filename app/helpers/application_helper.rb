module ApplicationHelper
  def show_error_message(attribute,value)
    "#{attribute} #{value}"
  end
  
  def owner_of_book?(user_book_object)
    current_user.id == user_book_object.user_id
  end

  def already_exist_in_cart?(user_id , book_id)
    Cart.exists?(user_id:user_id,user_book_id:book_id)
  end
end
