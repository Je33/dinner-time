class RecipeController < ApplicationController
  def upload
    file = params[:file].read
    data = JSON.parse(file)

    data.each do |recipe|
      Recipe.create!(
        title: recipe["title"],
        cook_time: recipe["cook_time"],
        prep_time: recipe["prep_time"],
        ratings: recipe["ratings"],
        cuisine: recipe["cuisine"],
        category: recipe["category"],
        author: recipe["author"],
        image: recipe["image"],
        ingredients: recipe["ingredients"],
      )
    end
  end

  def read
    recipes = Recipe.all
    if params[:search_recipe].present?
      recipes = recipes.search_title(params[:search_recipe])
    end
    if params[:search_ingredients].present?
      recipes = recipes.search_ingredients(params[:search_ingredients])
    end
    recipes = recipes.then(&paginate)
    render json: recipes
  end
end
