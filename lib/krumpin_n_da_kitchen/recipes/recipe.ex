defmodule KrumpinNDaKitchen.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :description, :string
    field :directions, {:array, :string}
    field :name, :string
    field :num_calories, :float
    field :num_servings, :integer
    field :prep_time, :integer

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :description, :prep_time, :num_servings, :num_calories, :directions])
    |> validate_required([:name, :description, :prep_time, :num_servings, :num_calories, :directions])
  end
end
