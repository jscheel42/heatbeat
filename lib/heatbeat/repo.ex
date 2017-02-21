defmodule Heatbeat.Repo do
  use Ecto.Repo, otp_app: :heatbeat
  use Scrivener, page_size: 24
end
