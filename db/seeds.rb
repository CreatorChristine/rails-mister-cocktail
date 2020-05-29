# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
list = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
def fetch(url)
  data_serialized = open(url).read
  return JSON.parse(data_serialized)
end

cocktails = fetch(list)

cocktails.each do |cocktail|
  c = Cocktail.create!(name: cocktail['name'])
  cocktail['ingredients'].each do |ingredient|
  i = Ingredient.find_or_create_by(
    name: ingredient['ingredient'])
  d = Dose.create(cocktail: c, ingredient: i, description: "#{ingredient['amount'.to_s]} #{ingredient['unit']}")
  end

end