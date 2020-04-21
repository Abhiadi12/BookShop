class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.string :body
      t.boolean :status , default: false

      t.timestamps
    end
    add_index :notifications, :recipient_id
  end
end
