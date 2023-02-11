class AddingDefaultValueToItem < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :status, :text, default: "Objet trouvé"
  end
end
