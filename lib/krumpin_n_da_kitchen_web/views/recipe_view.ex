defmodule KrumpinNDaKitchenWeb.RecipeView do
  use KrumpinNDaKitchenWeb, :view

  def render("index.json", %{recipes: recipes}) do
    render_many(recipes, __MODULE__, "recipe.json")
  end

  def render("recipe.json", %{recipe: recipe}) do
    %{
      data:
      %{
        name: recipe.name,
        description: recipe.description,
        prep: recipe.prep_time,
        servings: recipe.num_servings,
        calories: recipe.num_calories,
        directions: recipe.directions

      }
    }
  end

  def render("show.json", %{recipe: recipe}) do
    render_one(recipe, __MODULE__, "recipe.json")
  end
end
