ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Heatbeat.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Heatbeat.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Heatbeat.Repo)

