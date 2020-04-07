class CreateBookDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :book_details do |t|
      t.string :name
      t.references :author, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
