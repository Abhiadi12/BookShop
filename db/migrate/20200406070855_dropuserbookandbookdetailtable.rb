class Dropuserbookandbookdetailtable < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_books, if_exists: true
    drop_table :book_details, if_exists: true
  end
end
