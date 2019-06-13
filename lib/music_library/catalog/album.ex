defmodule MusicLibrary.Catalog.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicLibrary.Catalog.Artist
  alias MusicLibrary.Catalog.Track

  schema "albums" do
    field :album_artist, :string
    field :compoeser, :string
    field :cover, :string
    field :mb_id, :string
    field :path, :string
    field :title, :string, null: false
    field :year, :integer
    belongs_to :artist, Artist
    has_many :tracks, Track

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:title, :year, :path, :cover, :album_artist, :compoeser, :mb_id])
    |> validate_required([:title, :year, :path, :cover, :album_artist, :compoeser, :mb_id])
    |> unique_constraint(:path)
  end
end
