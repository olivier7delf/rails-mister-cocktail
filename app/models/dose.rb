class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient,
    message: "should have only 1 desc - cocktail - ingredient" }
end
