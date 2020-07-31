# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all

require "open-uri"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
ingredients_arr = drinks.values[0]
ingredients_arr.each_with_index do |e, index|
 Ingredient.create!(name: ingredients_arr[index]["strIngredient1"])
 puts "ingredient#{index} created!"
end


url2 = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
drinks = JSON.parse(open(url2).read)
drinks_arr = drinks.values[0]
drinks_arr.each_with_index do |e, index|
 Cocktail.create!(name: drinks_arr[index]["strDrink"])
 puts "cocktail#{index} created!"
end
