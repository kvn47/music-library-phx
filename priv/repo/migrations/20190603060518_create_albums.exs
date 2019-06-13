defmodule MusicLibrary.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :year, :integer
      add :path, :string
      add :cover, :string
      add :album_artist, :string
      add :compoeser, :string
      add :mb_id, :string
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:albums, [:path])
    create index(:albums, [:artist_id])
  end
end
