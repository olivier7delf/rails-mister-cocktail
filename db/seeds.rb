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

IMAGE_URLS = [
  "https://images.unsplash.com/photo-1551024709-8f23befc6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1125&q=80",
  "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1536935338788-846bb9981813?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1536599424071-0b215a388ba7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1556855810-ac404aa91e85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
]

# db/seeds.rb
puts "create 3 Ingredients"
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

require 'json'
require 'open-uri'

source = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.load(open(source))

Cocktail.create(name: "cocktail banane", image_url: IMAGE_URLS.sample())
Cocktail.create(name: "cocktail ice", image_url: IMAGE_URLS.sample())
Cocktail.create(name: "cocktail mint leaves", image_url: IMAGE_URLS.sample())
Cocktail.create(name: "cocktail banane 2", image_url: IMAGE_URLS.sample())
Cocktail.create(name: "cocktail ice 2", image_url: IMAGE_URLS.sample())
Cocktail.create(name: "cocktail mint leaves 2", image_url: IMAGE_URLS.sample())
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
