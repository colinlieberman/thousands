class Item < ApplicationRecord
  validates :name, presence: true
  validates :length_mm, presence: true
end
