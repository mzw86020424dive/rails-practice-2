class Favorite < ApplicationRecord
  belongs_to :item
  belongs_to :member
end
