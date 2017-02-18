defmodule Heatbeat.SensorController do
  use Heatbeat.Web, :controller

  alias Heatbeat.Sensor

  plug :scrub_params, "sensor" when action in [:create, :update]

  def index(conn, params) do
    # sensors = Repo.all(Sensor)
    recent_sensors = 
      Sensor
      |> Sensor.recent(15)
      |> Repo.all()
      
    page = 
      Sensor
      |> Sensor.all_desc()
      |> Heatbeat.Repo.paginate(params)

    # render(conn, "index.html", recent_sensors: recent_sensors)
    
    render conn, :index,
      recent_sensors: recent_sensors,
      page: page,
      sensors: page.entries,
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
      total_entries: page.total_entries
      
  end
end
