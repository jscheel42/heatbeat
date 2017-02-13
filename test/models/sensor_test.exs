defmodule Heatbeat.SensorTest do
  use Heatbeat.ModelCase

  alias Heatbeat.Sensor

  @valid_attrs %{humidity: "120.5", temperature: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sensor.changeset(%Sensor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sensor.changeset(%Sensor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
