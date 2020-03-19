class CreatePaymentHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_histories do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :transaction_id
      t.string :bank_name
      t.boolean :status

      t.timestamps
    end
  end
end
