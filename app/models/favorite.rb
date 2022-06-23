class Favorite < ApplicationRecord
  belongs_to :item
  belongs_to :member

  validates :item_id, uniqueness: { scope: :member_id }

end
