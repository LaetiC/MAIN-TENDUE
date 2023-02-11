class AddingStatusToRequest < ActiveRecord::Migration[7.0]
  def change
    change_column :requests, :status, :text, default: "pending"
  end
end
