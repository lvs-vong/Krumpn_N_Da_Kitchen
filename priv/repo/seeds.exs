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

%KrumpinNDaKitchen.Categories.Tag{name: "Test Tag"} |> Repo.insert()
%KrumpinNDaKitchen.Categories.Tag{name: "Tag2"} |> Repo.insert()
%KrumpinNDaKitchen.Categories.Tag{name: "Delicious"} |> Repo.insert()

%KrumpinNDaKitchen.Recipes.Recipe{name: "Chicken Nuggets",
                            description: "Chicken nuggies for breakfast, I guess.",
                            directions: ["Put the pound of chicken in a bowl along with ground bread, 1 tb of garlic powder, cumin and mustard powder and pepper", "Mix it all together", "Oil up your hands and shape the nuggets", "Scramble some eggs and dip the nuggets and then dip them in panko", "Heat a small amount of oil to 300 degrees (monitor your oil temperature) and put the nuggets in with tongs.", "Flip them after a couple of minutes. Make sure they get to atleast 165 degrees F before you take them out.", "Enjoy!"],
                            prep_time: 5,
                            num_servings: 1,
                            num_calories: 500.0
                          } |> Repo.insert()
