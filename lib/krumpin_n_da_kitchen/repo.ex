defmodule KrumpinNDaKitchen.Repo do
  use Ecto.Repo,
    otp_app: :krumpin_n_da_kitchen,
    adapter: Ecto.Adapters.Postgres
end
