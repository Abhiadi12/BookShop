class CreateCategoties < ActiveRecord::Migration[6.0]
  def change
    create_table :categoties do |t|
      t.string :name

      t.timestamps
    end
  end
end
