class UpdateNullToItemIdOnRequest < ActiveRecord::Migration[7.0]
  def change
    change_column :requests, :item_id, :bigint, null: true
  end
end
