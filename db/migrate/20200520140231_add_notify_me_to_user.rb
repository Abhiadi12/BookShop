class AddNotifyMeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users , :notify , :boolean , default: false
  end
end
