defmodule MusicLibraryWeb.TrackView do
  use MusicLibraryWeb, :view
  alias MusicLibraryWeb.TrackView

  def render("index.json", %{tracks: tracks}) do
    %{data: render_many(tracks, TrackView, "track.json")}
  end

  def render("show.json", %{track: track}) do
    %{data: render_one(track, TrackView, "track.json")}
  end

  def render("track.json", %{track: track}) do
    %{id: track.id,
      number: track.number,
      title: track.title,
      path: track.path,
      size: track.size,
      length: track.length,
      mb_id: track.mb_id}
  end
end
