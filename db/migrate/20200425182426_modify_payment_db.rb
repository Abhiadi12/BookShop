class ModifyPaymentDb < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments , :UserBook_id , :integer
    add_reference :payments, :user_book , index: true
    add_column :payments , :status , :boolean , default: false
  end
end
