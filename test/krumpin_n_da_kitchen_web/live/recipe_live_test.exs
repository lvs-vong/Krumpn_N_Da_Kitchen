defmodule KrumpinNDaKitchenWeb.RecipeLiveTest do
  use KrumpinNDaKitchenWeb.ConnCase

  import Phoenix.LiveViewTest
  import KrumpinNDaKitchen.CoreFixtures

  @create_attrs %{description: "some description", directions: [], name: "some name", num_calories: 120.5, num_servings: 42, prep_time: 42}
  @update_attrs %{description: "some updated description", directions: [], name: "some updated name", num_calories: 456.7, num_servings: 43, prep_time: 43}
  @invalid_attrs %{description: nil, directions: [], name: nil, num_calories: nil, num_servings: nil, prep_time: nil}

  defp create_recipe(_) do
    recipe = recipe_fixture()
    %{recipe: recipe}
  end

  describe "Index" do
    setup [:create_recipe]

    test "lists all recipes", %{conn: conn, recipe: recipe} do
      {:ok, _index_live, html} = live(conn, Routes.recipe_index_path(conn, :index))

      assert html =~ "Listing Recipes"
      assert html =~ recipe.description
    end

    test "saves new recipe", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.recipe_index_path(conn, :index))

      assert index_live |> element("a", "New Recipe") |> render_click() =~
               "New Recipe"

      assert_patch(index_live, Routes.recipe_index_path(conn, :new))

      assert index_live
             |> form("#recipe-form", recipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#recipe-form", recipe: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.recipe_index_path(conn, :index))

      assert html =~ "Recipe created successfully"
      assert html =~ "some description"
    end

    test "updates recipe in listing", %{conn: conn, recipe: recipe} do
      {:ok, index_live, _html} = live(conn, Routes.recipe_index_path(conn, :index))

      assert index_live |> element("#recipe-#{recipe.id} a", "Edit") |> render_click() =~
               "Edit Recipe"

      assert_patch(index_live, Routes.recipe_index_path(conn, :edit, recipe))

      assert index_live
             |> form("#recipe-form", recipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#recipe-form", recipe: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.recipe_index_path(conn, :index))

      assert html =~ "Recipe updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes recipe in listing", %{conn: conn, recipe: recipe} do
      {:ok, index_live, _html} = live(conn, Routes.recipe_index_path(conn, :index))

      assert index_live |> element("#recipe-#{recipe.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#recipe-#{recipe.id}")
    end
  end

  describe "Show" do
    setup [:create_recipe]

    test "displays recipe", %{conn: conn, recipe: recipe} do
      {:ok, _show_live, html} = live(conn, Routes.recipe_show_path(conn, :show, recipe))

      assert html =~ "Show Recipe"
      assert html =~ recipe.description
    end

    test "updates recipe within modal", %{conn: conn, recipe: recipe} do
      {:ok, show_live, _html} = live(conn, Routes.recipe_show_path(conn, :show, recipe))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Recipe"

      assert_patch(show_live, Routes.recipe_show_path(conn, :edit, recipe))

      assert show_live
             |> form("#recipe-form", recipe: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#recipe-form", recipe: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.recipe_show_path(conn, :show, recipe))

      assert html =~ "Recipe updated successfully"
      assert html =~ "some updated description"
    end
  end
end