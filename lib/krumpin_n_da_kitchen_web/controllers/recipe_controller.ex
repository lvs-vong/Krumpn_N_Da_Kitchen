defmodule KrumpinNDaKitchenWeb.RecipeController do
  use KrumpinNDaKitchenWeb, :controller

  alias KrumpinNDaKitchen.Recipes
  alias KrumpinNDaKitchen.Recipes.Recipe

  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, "index.html", recipes: recipes)
  end

  def new(conn, _params) do
    preloads = [:tags]
    recipe = %Recipe{} |> KrumpinNDaKitchen.Repo.preload(preloads)
    changeset = Recipes.change_recipe(recipe)
    IO.inspect(changeset.data.tags)

    tags = KrumpinNDaKitchen.Categories.list_tags()

    render(conn, "new.html", changeset: changeset, tags: tags)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    case Recipes.create_recipe(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: Routes.recipe_path(conn, :show, recipe))

      {:error, changeset} ->
        data = Recipes.load_tags(changeset.data)
        tags = KrumpinNDaKitchen.Categories.list_tags()

        conn
        |> put_flash(:error, "Error!")
        |> render("new.html", %{changeset | data: data}, tags)
    end
  end

  def show(conn, %{"id" => id}) do
    preloads = [:tags]
    recipe = Recipes.get_recipe!(id)
      |>  KrumpinNDaKitchen.Repo.preload(preloads)
    IO.inspect(recipe)
    render(conn, "show.html", recipe: recipe)
  end

  def edit(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    changeset = Recipes.change_recipe(recipe)
    render(conn, "edit.html", recipe: recipe, changeset: changeset)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Recipes.get_recipe!(id)

    case Recipes.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: Routes.recipe_path(conn, :show, recipe))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", recipe: recipe, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    {:ok, _recipe} = Recipes.delete_recipe(recipe)

    conn
    |> put_flash(:info, "Recipe deleted successfully.")
    |> redirect(to: Routes.recipe_path(conn, :index))
  end

  def jsonIndex(conn, _params) do
    recipes = KrumpinNDaKitchen.Recipes.list_recipes()
    render(conn, "index.json", recipes: recipes)
  end

  def jsonShow(conn, %{"id" => id}) do
    {id, _} = Integer.parse(id)
    recipe = KrumpinNDaKitchen.Recipes.get_recipe!(id)
    render(conn, "show.json", recipe: recipe)
  end
end
