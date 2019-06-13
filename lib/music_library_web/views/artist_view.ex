defmodule MusicLibraryWeb.ArtistView do
  use MusicLibraryWeb, :view
  alias MusicLibraryWeb.ArtistView

  def render("index.json", %{artists: artists}) do
    %{data: render_many(artists, ArtistView, "artist.json")}
  end

  def render("show.json", %{artist: artist}) do
    %{data: render_one(artist, ArtistView, "artist.json")}
  end

  def render("artist.json", %{artist: artist}) do
    %{id: artist.id,
      name: artist.name,
      path: artist.path,
      image: artist.image,
      mbid: artist.mbid}
  end
end
