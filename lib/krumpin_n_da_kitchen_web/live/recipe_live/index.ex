defmodule KrumpinNDaKitchenWeb.RecipeLive.Index do
  use KrumpinNDaKitchenWeb, :live_view

  alias KrumpinNDaKitchen.Core
  alias KrumpinNDaKitchen.Core.Recipe

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :recipes, list_recipes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Recipe")
    |> assign(:recipe, Core.get_recipe!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Recipe")
    |> assign(:recipe, %Recipe{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Recipes")
    |> assign(:recipe, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    recipe = Core.get_recipe!(id)
    {:ok, _} = Core.delete_recipe(recipe)

    {:noreply, assign(socket, :recipes, list_recipes())}
  end

  defp list_recipes do
    Core.list_recipes()
  end
end