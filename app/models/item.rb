class Item < ApplicationRecord
  belongs_to :user
  has_many :requests

  has_one_attached :photo
end
