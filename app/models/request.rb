class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true

  validates :needed_item, presence: true
  validates :category, presence: true, inclusion: { in: ["Hygiène", "Médical", "Petit électroménager", "Puériculture"],
  message: "%{value} n'est pas une catégorie valide. Veuillez choisir dans la liste proposée" }
end
