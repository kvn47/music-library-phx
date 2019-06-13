defmodule MusicLibrary.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string, null: false
      add :path, :string
      add :image, :string
      add :mbid, :string

      timestamps()
    end

  end
end
