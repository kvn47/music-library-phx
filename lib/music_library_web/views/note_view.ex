defmodule MusicLibraryWeb.NoteView do
  use MusicLibraryWeb, :view
  alias MusicLibraryWeb.NoteView

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{id: note.id,
      kind: note.kind,
      position: note.position,
      artist: note.artist,
      album: note.album,
      details: note.details,
      release_date: note.release_date,
      download_url: note.download_url,
      download_path: note.download_path}
  end
end
