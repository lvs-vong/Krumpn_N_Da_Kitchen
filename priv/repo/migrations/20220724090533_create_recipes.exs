defmodule KrumpinNDaKitchen.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :description, :string
      add :prep_time, :integer
      add :num_servings, :integer
      add :num_calories, :float
      add :directions, {:array, :text}

      timestamps()
    end
  end
end
