class Removequantity < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_books, :quantity, :integer
  end
end
