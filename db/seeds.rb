# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cocktail.destroy_all"
Cocktail.destroy_all
puts "Dose.destroy_all"
Dose.destroy_all
puts "destroy_all"
Ingredient.destroy_all

# db/seeds.rb
puts "create 3 Ingredients"
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

require 'json'
require 'open-uri'

source = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.load(open(source))

Cocktail.create(name: "cocktail banane")
Cocktail.create(name: "cocktail ice")
Cocktail.create(name: "cocktail mint leaves")
Cocktail.create(name: "cocktail banane 2")
Cocktail.create(name: "cocktail ice 2")
Cocktail.create(name: "cocktail mint leaves 2")
puts "cocktails create 6"

data["drinks"].sample(10).each do |ingredient|
  puts "create 1 ingredient", ingredient["strIngredient1"]
  Ingredient.create(name: ingredient["strIngredient1"])

  puts "create and link one dose"
  d = Dose.new(description: "1.5 mL")
  d.cocktail = Cocktail.all.sample(1)[0]
  d.ingredient = Ingredient.all.sample(1)[0]
  d.save
end
