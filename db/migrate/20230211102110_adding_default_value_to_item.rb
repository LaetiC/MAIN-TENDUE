class AddingDefaultValueToItem < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :status, :text, default: "created"
  end
end
