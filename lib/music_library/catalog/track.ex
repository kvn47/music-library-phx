defmodule MusicLibrary.Catalog.Track do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicLibrary.Catalog.Album

  schema "tracks" do
    field :length, :integer
    field :mb_id, :string
    field :number, :integer
    field :path, :string
    field :size, :integer
    field :title, :string, null: false
    belongs_to :album, Album

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:number, :title, :path, :size, :length, :mb_id])
    |> validate_required([:number, :title, :path, :size, :length, :mb_id])
  end
end
