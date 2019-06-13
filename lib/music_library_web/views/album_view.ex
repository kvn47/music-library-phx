defmodule MusicLibraryWeb.AlbumView do
  use MusicLibraryWeb, :view
  alias MusicLibraryWeb.AlbumView

  def render("index.json", %{albums: albums}) do
    %{data: render_many(albums, AlbumView, "album.json")}
  end

  def render("show.json", %{album: album}) do
    %{data: render_one(album, AlbumView, "album.json")}
  end

  def render("album.json", %{album: album}) do
    %{id: album.id,
      title: album.title,
      year: album.year,
      path: album.path,
      cover: album.cover,
      album_artist: album.album_artist,
      compoeser: album.compoeser,
      mb_id: album.mb_id}
  end
end
