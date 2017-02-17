defmodule Heatbeat.Sensor do
  use Heatbeat.Web, :model

  schema "sensors" do
    field :temperature, :float
    field :humidity, :float
    timestamps(updated_at: false)
  end

  @required_fields ~w(temperature humidity)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
  
  def recent(query) do
    from s in query,
      order_by: [desc: s.inserted_at],
      limit: 3
  end
end
