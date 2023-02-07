class UpdateNullToItem < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :user_id, :bigint, null: true
  end
end
