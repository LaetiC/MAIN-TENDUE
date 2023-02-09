class Request < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  validates :needed_item, presence: true
  validates :category, presence: true, inclusion: { in: ["Hygiène", "Médical", "Petit électroménager", "Puériculture"],
  message: "%{value} n'est pas une catégorie valide. Veuillez choisir dans la liste proposée" }

  scope :pending, -> { where(status: "en attente de confirmation") }
  scope :found, -> { where(status: "un object a été trouvé") }
  scope :confirmed, -> { where(status: "confirmé") }
  scope :canceled, -> { where(status: "annulé") }
  scope :sent, -> { where(status: "reçu") }
end
