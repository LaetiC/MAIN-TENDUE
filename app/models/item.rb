class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :requests

  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, inclusion: {
    in: ["Hygiène", "Paramédical", "Petit électroménager", "Puériculture", "Vêtement", "Autres"],
    message: "%{value} n'est pas une catégorie valide. Veuillez choisir dans la liste proposée"
  }

  scope :created, -> { where(status: "Créé") }
  scope :available, -> { where(status: "Disponible") }
  scope :attributed, -> { where(status: "Attribué") }

end
