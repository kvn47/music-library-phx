defmodule MusicLibraryWeb.ArtistController do
  use MusicLibraryWeb, :controller

  alias MusicLibrary.Catalog
  alias MusicLibrary.Catalog.Artist

  action_fallback MusicLibraryWeb.FallbackController

  def index(conn, _params) do
    artists = Catalog.list_artists()
    render(conn, "index.json", artists: artists)
  end

  def create(conn, %{"artist" => artist_params}) do
    with {:ok, %Artist{} = artist} <- Catalog.create_artist(artist_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.artist_path(conn, :show, artist))
      |> render("show.json", artist: artist)
    end
  end

  def show(conn, %{"id" => id}) do
    artist = Catalog.get_artist!(id)
    render(conn, "show.json", artist: artist)
  end

  def update(conn, %{"id" => id, "artist" => artist_params}) do
    artist = Catalog.get_artist!(id)

    with {:ok, %Artist{} = artist} <- Catalog.update_artist(artist, artist_params) do
      render(conn, "show.json", artist: artist)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist = Catalog.get_artist!(id)

    with {:ok, %Artist{}} <- Catalog.delete_artist(artist) do
      send_resp(conn, :no_content, "")
    end
  end
end
