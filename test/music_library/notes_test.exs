defmodule MusicLibrary.NotesTest do
  use MusicLibrary.DataCase

  alias MusicLibrary.Notes

  describe "notes" do
    alias MusicLibrary.Notes.Note

    @valid_attrs %{album: "some album", artist: "some artist", details: "some details", download_path: "some download_path", download_url: "some download_url", kind: "some kind", release_date: ~D[2010-04-17]}
    @update_attrs %{album: "some updated album", artist: "some updated artist", details: "some updated details", download_path: "some updated download_path", download_url: "some updated download_url", kind: "some updated kind", release_date: ~D[2011-05-18]}
    @invalid_attrs %{album: nil, artist: nil, details: nil, download_path: nil, download_url: nil, kind: nil, release_date: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notes.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Notes.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Notes.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Notes.create_note(@valid_attrs)
      assert note.album == "some album"
      assert note.artist == "some artist"
      assert note.details == "some details"
      assert note.download_path == "some download_path"
      assert note.download_url == "some download_url"
      assert note.kind == "some kind"
      assert note.release_date == ~D[2010-04-17]
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = Notes.update_note(note, @update_attrs)
      assert note.album == "some updated album"
      assert note.artist == "some updated artist"
      assert note.details == "some updated details"
      assert note.download_path == "some updated download_path"
      assert note.download_url == "some updated download_url"
      assert note.kind == "some updated kind"
      assert note.release_date == ~D[2011-05-18]
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_note(note, @invalid_attrs)
      assert note == Notes.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Notes.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Notes.change_note(note)
    end
  end
end
