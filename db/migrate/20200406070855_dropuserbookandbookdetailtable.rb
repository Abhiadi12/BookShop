class Dropuserbookandbookdetailtable < ActiveRecord::Migration[6.0]
  def change
      drop_table :user_books
      drop_table :book_details
  end
end
