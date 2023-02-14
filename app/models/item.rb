class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :requests

  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, inclusion: {
    in: ["Hygiène", "Paramédical", "Petit électroménager", "Puériculture"],
    message: "%{value} n'est pas une catégorie valide. Veuillez choisir dans la liste proposée"
  }

  scope :created, -> { where(status: "Objet trouvé") }
  scope :available, -> { where(status: "Objet disponible") }
  scope :attributed, -> { where(status: "Objet attribué") }

end
