defmodule Heatbeat.Repo.Migrations.CreateSensor do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :humidity, :real
      add :temperature, :real
      timestamps(updated_at: false)
    end
    
    create unique_index(:sensors, [:id])

  end
end
