defmodule MusicLibrary.Repo do
  use Ecto.Repo,
    otp_app: :music_library,
    adapter: Ecto.Adapters.Postgres
end
