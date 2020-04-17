class AddRatingColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :user_books , :rating , :integer , default: 0
  end
end
