class ModifyTheCart < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :book_detail_id, :integer
    remove_column :carts, :quantity, :integer
    add_reference :carts, :user_book , index: true
  end
end
