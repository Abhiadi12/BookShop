class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book_detail, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
