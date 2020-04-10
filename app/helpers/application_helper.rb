module ApplicationHelper
  def show_error_message(attribute,value)
    "#{attribute} #{value}"
  end
  
  def owner_of_book?(user_book_object)
    current_user.id == user_book_object.user_id
  end
end
