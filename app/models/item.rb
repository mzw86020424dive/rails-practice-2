class Item < ApplicationRecord
  belongs_to :member
  belongs_to :tag
  has_many :favorites
  has_many :favorite_members, through: :favorites, source: :member

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end
