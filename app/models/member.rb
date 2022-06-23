class Member < ApplicationRecord
    has_many :items
    has_many :favorites
    has_many :favorite_items, through: :favorites, source: :item
end
