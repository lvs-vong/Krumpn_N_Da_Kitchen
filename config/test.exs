import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :krumpin_n_da_kitchen, KrumpinNDaKitchen.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "krumpin_n_da_kitchen_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :krumpin_n_da_kitchen, KrumpinNDaKitchenWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qbStXU1NQJbA1ls5Js2ImGwNeL60L+/8VvPaHw9HMn6KJUtNPjPEumeeF0/BQOlJ",
  server: false

# In test we don't send emails.
config :krumpin_n_da_kitchen, KrumpinNDaKitchen.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
