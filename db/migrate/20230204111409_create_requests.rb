class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.date :dropoff_date
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.string :category
      t.string :needed_item
      t.references :item, null: false, foreign_key: true
      t.date :pickup_date
      t.string :pickup_type

      t.timestamps
    end
  end
end
