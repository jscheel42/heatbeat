defmodule Heatbeat.Repo.Migrations.CreateSensorInfo do
  use Ecto.Migration

  def change do
    create table(:sensor_info) do
      add :humidity, :real
      add :temperature, :real
      timestamps
    end
    
    create unique_index(:sensor_info, [:id])

  end
end
