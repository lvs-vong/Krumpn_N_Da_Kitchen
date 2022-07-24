defmodule KrumpinNDaKitchen.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KrumpinNDaKitchen.Core` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        description: "some description",
        directions: [],
        name: "some name",
        num_calories: 120.5,
        num_servings: 42,
        prep_time: 42
      })
      |> KrumpinNDaKitchen.Core.create_recipe()

    recipe
  end
end
