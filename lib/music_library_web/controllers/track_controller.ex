defmodule MusicLibraryWeb.TrackController do
  use MusicLibraryWeb, :controller

  alias MusicLibrary.Catalog
  alias MusicLibrary.Catalog.Track

  action_fallback MusicLibraryWeb.FallbackController

  def index(conn, _params) do
    tracks = Catalog.list_tracks()
    render(conn, "index.json", tracks: tracks)
  end

  def create(conn, %{"track" => track_params}) do
    with {:ok, %Track{} = track} <- Catalog.create_track(track_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.track_path(conn, :show, track))
      |> render("show.json", track: track)
    end
  end

  def show(conn, %{"id" => id}) do
    track = Catalog.get_track!(id)
    render(conn, "show.json", track: track)
  end

  def update(conn, %{"id" => id, "track" => track_params}) do
    track = Catalog.get_track!(id)

    with {:ok, %Track{} = track} <- Catalog.update_track(track, track_params) do
      render(conn, "show.json", track: track)
    end
  end

  def delete(conn, %{"id" => id}) do
    track = Catalog.get_track!(id)

    with {:ok, %Track{}} <- Catalog.delete_track(track) do
      send_resp(conn, :no_content, "")
    end
  end
end
