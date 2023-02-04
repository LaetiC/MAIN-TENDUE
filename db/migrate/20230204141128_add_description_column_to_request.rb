class AddDescriptionColumnToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :description, :text
  end
end
