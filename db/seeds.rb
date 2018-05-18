require 'open-uri'

puts("Cleaning past seeds")
Ingredient.destroy_all
puts("Adding ingredients")

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
