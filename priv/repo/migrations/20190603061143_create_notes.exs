defmodule MusicLibrary.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :position, :integer
      add :kind, :string
      add :artist, :string
      add :album, :string
      add :details, :text
      add :release_date, :date
      add :download_url, :string
      add :download_path, :string

      timestamps()
    end

  end
end
