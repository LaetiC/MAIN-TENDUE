class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :needed_item, presence: true
  validates :category, presence: true
end
