class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :UserBook, null: false, foreign_key: true
      t.string :book_name

      t.timestamps
    end
  end
end
