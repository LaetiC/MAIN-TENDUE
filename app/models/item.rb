class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :requests

  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, presence: true, inclusion: { in: ["Hygiène", "Médical", "Petit électroménager", "Puériculture"],
  message: "%{value} n'est pas une catégorie valide. Veuillez choisir dans la liste proposée" }
end
