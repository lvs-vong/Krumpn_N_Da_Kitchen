defmodule KrumpinNDaKitchen.RecipesTags do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "recipes_tags" do
    belongs_to :recipe, KrumpinNDaKitchen.Recipes.Recipe
    belongs_to :tag, KrumpinNDaKitchen.Categories.Tag
  end

  @doc false
  def changeset(relationship, attrs) do
    relationship
    |> cast(attrs, [:recipe_id, :tag_id])
    |> validate_required([:recipe_id, :tag_id])
  end
end
