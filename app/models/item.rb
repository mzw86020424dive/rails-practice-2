class Item < ApplicationRecord
  belongs_to :member
  has_many :favorites
end
