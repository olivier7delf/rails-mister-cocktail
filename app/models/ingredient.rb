class Ingredient < ApplicationRecord
  has_many :doses#, dependent: :destroy -> should not be able to destroy self if has dose children

  validates :name, presence: true, uniqueness: true
  # has_many :cocktail, through: :doses
end
