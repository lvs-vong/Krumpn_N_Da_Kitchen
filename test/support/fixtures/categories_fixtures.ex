defmodule KrumpinNDaKitchen.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KrumpinNDaKitchen.Categories` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> KrumpinNDaKitchen.Categories.create_tag()

    tag
  end

  @doc """
  Generate a ingredient.
  """
  def ingredient_fixture(attrs \\ %{}) do
    {:ok, ingredient} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> KrumpinNDaKitchen.Categories.create_ingredient()

    ingredient
  end
end
