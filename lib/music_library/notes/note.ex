defmodule MusicLibrary.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :album, :string
    field :artist, :string
    field :details, :string
    field :download_path, :string
    field :download_url, :string
    field :kind, :string
    field :release_date, :date

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:kind, :artist, :album, :details, :release_date, :download_url, :download_path])
    |> validate_required([:kind])
  end
end
