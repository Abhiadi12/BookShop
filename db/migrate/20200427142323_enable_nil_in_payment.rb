class EnableNilInPayment < ActiveRecord::Migration[6.0]
  def change
    change_column :payments , :user_book_id , :integer , null:true
  end
end
