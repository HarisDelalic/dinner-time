class FillRecipes < ActiveRecord::Migration[6.0]
  def up
    recipes_as_json = File.read("#{Rails.root}/lib/tasks/recipes-en.json")

    JSON.parse(recipes_as_json).each do |recipe_json_object|
      title = recipe_json_object["title"]
      cook_time = recipe_json_object["cook_time"]
      prep_time = recipe_json_object["prep_time"]
      ratings = recipe_json_object["ratings"]
      cuisine = recipe_json_object["cuisine"]
      category = recipe_json_object["category"]
      author = recipe_json_object["author"]
      image = recipe_json_object["image"]

      ingredients = to_object(recipe_json_object["ingredients"], title)

      Recipe.create!(title: title, cook_time: cook_time, prep_time: prep_time, ratings: ratings, cuisine: cuisine,
                     category: category, author: author, image: image, ingredients: ingredients)
    end
  end

  def down
    Ingredient.delete_all
    Recipe.delete_all
  end

  private
  def to_object(ingredients, title)
    mapped_ingredients = []
    ingredients.each do |ingredient|
      puts "PARSING INGREDIENT: #{ingredient}"
      parsed_ingredient = IngredientParser.parse(ingredient)
      if parsed_ingredient.nil?
        File.write("#{Rails.root}/lib/tasks/errors.txt", "recipe with title: #{title} is not properly inserted in DB, due to error in INGREDIENT: #{ingredient} \n", mode: 'a')
      else
        mapped_ingredients << parsed_ingredient
      end
    end
    mapped_ingredients
  end
end