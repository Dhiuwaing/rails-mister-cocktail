require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingred = JSON.parse(open(url).read)
array = ingred.values[0]
array.each_with_index do |e, index|
  Ingredient.create!(name: array[index]["strIngredient1"])
  puts "Ingredient#{index} created"
end 

url2 = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
cocktails = JSON.parse(open(url).read)
array2 = cocktails.values[0]
array2.each_with_index do |e, index|
  Cocktail.create!(name: array2[index]["strDrink"])
  puts "Cocktail#{index} created"
end 
