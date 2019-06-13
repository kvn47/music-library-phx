defmodule MusicLibrary.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :number, :integer
      add :title, :string
      add :path, :string
      add :size, :integer
      add :length, :integer
      add :mb_id, :string
      add :album_id, references(:albums, on_delete: :nothing)

      timestamps()
    end

    create index(:tracks, [:album_id])
  end
end
