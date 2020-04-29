class PaymentPart < ActiveRecord::Migration[6.0]
  def change
    drop_table :payment_histories
  end
end
