class AddColumnToNotification < ActiveRecord::Migration[6.0]
  def change
    if not index_exists?(:notifications , :recipient_id)
      add_index :notifications , :recipient_id
    end
  end
end
