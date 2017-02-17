defmodule Heatbeat.SensorController do
  use Heatbeat.Web, :controller

  alias Heatbeat.Sensor

  plug :scrub_params, "sensor" when action in [:create, :update]

  def index(conn, _params) do
    # sensors = Repo.all(Sensor)
    recent_sensors = 
      Sensor
      |> Sensor.recent()
      |> Repo.all()
    
    render(conn, "index.html", recent_sensors: recent_sensors)
    # render(conn, "index.html", sensors: sensors)
  end
end
