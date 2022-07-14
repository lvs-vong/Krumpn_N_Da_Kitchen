# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KrumpinNDaKitchen.Repo.insert!(%KrumpinNDaKitchen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias KrumpinNDaKitchen.Repo

%KrumpinNDaKitchen.Recipes.Recipe{name: "Chicken Nuggets",
                            description: "Chicken nuggies for breakfast, I guess.",
                            directions: ["1. step one goes here", "2. step 2 here", "3. lastly, step 3 heere"],
                            prep_time: 5,
                            num_servings: 1,
                            num_calories: 500.0
                          } |> Repo.insert()
