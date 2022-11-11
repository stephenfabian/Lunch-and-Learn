class RecipeFacade < RecipeService

  def self.create_recipe_poros(country)
    data = RecipeService.recipe_data_by_country(country)
    first_10_recipes = data[:hits].take(10)
    first_10_recipes.map do |recipe_hash|
      recipe_attributes = recipe_hash[:recipe].slice(:label, :url, :image)
      Recipe.new(recipe_attributes)
    end
  end
end