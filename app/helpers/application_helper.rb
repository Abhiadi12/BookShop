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

  def book_exist_in_payment_mode?(id)
    Payment.exists?(user_book_id:id , status:false) # if this happen then the item must be outofstock for others
  end

  def convert_to_readable_date(date)
    array = date.split("-")
    case array[1]
    when "01"  
      "#{array[2]} Jan #{array[0]}"
    when "02"  
      "#{array[2]} Feb #{array[0]}"
    when "03"  
      "#{array[2]} Mar #{array[0]}"
    when "04"  
      "#{array[2]} Apr #{array[0]}"
    when "05"  
      "#{array[2]} May #{array[0]}"
    when "06"  
      "#{array[2]} Jun #{array[0]}"
    when "07"  
      "#{array[2]} Jul #{array[0]}"
    when "08"  
      "#{array[2]} Aug #{array[0]}"
    when "09"  
      "#{array[2]} Sep #{array[0]}"
    when "10"  
      "#{array[2]} Oct #{array[0]}"
    when "11"  
      "#{array[2]} Nov #{array[0]}"
    else
      "#{array[2]} Dec #{array[0]}"
    end
  end
end