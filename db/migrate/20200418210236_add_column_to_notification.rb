class AddColumnToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :user_book , index: true
  end
end
