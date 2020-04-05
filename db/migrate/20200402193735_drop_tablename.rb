class DropTablename < ActiveRecord::Migration[6.0]
  def change
    drop_table :categoties
  end
end
