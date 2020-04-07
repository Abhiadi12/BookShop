class CreateUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book_detail, null: false, foreign_key: true
      t.integer :price
      t.string :review
      t.integer :page_count
      t.integer :quantity

      t.timestamps
    end
  end
end
