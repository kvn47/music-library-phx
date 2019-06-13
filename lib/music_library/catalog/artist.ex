defmodule MusicLibrary.Catalog.Artist do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicLibrary.Catalog.Album

  schema "artists" do
    field :image, :string
    field :mbid, :string
    field :name, :string
    field :path, :string
    has_many :albums, Album

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name, :path, :image, :mbid])
    |> validate_required([:name, :path, :image, :mbid])
  end
end
