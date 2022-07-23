defmodule KrumpinNDaKitchen.Repo.Migrations.CreateRecipesTags do
  use Ecto.Migration

  def change do
    create table(:recipes_tags) do
      add :recipe_id, references(:recipes, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)
    end

    create index(:recipes_tags, [:recipe_id])
    create index(:recipes_tags, [:tag_id])
  end
end
