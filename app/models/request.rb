class Request < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  validates :needed_item, presence: true
  validates :category, presence: true, inclusion: { in: ["Hygiène", "Paramédical", "Petit électroménager", "Puériculture"],
  message: "%{value} n'est pas une catégorie valide. Veuillez choisir dans la liste proposée" }

  scope :pending, -> { where(status: ["En recherche", "Besoin trouvé", "A la Ressourcerie"]) } #syntaxe à vérifier pour status multiples
  scope :closed, -> { where(status: ["Remis", "Annulée"]) } #syntaxe à vérifier pour status multiples
end
