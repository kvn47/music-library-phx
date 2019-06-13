defmodule MusicLibraryWeb.NoteControllerTest do
  use MusicLibraryWeb.ConnCase

  alias MusicLibrary.Notes
  alias MusicLibrary.Notes.Note

  @create_attrs %{
    album: "some album",
    artist: "some artist",
    details: "some details",
    download_path: "some download_path",
    download_url: "some download_url",
    kind: "some kind",
    release_date: ~D[2010-04-17]
  }
  @update_attrs %{
    album: "some updated album",
    artist: "some updated artist",
    details: "some updated details",
    download_path: "some updated download_path",
    download_url: "some updated download_url",
    kind: "some updated kind",
    release_date: ~D[2011-05-18]
  }
  @invalid_attrs %{album: nil, artist: nil, details: nil, download_path: nil, download_url: nil, kind: nil, release_date: nil}

  def fixture(:note) do
    {:ok, note} = Notes.create_note(@create_attrs)
    note
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notes", %{conn: conn} do
      conn = get(conn, Routes.note_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create note" do
    test "renders note when data is valid", %{conn: conn} do
      conn = post(conn, Routes.note_path(conn, :create), note: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.note_path(conn, :show, id))

      assert %{
               "id" => id,
               "album" => "some album",
               "artist" => "some artist",
               "details" => "some details",
               "download_path" => "some download_path",
               "download_url" => "some download_url",
               "kind" => "some kind",
               "release_date" => "2010-04-17"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.note_path(conn, :create), note: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update note" do
    setup [:create_note]

    test "renders note when data is valid", %{conn: conn, note: %Note{id: id} = note} do
      conn = put(conn, Routes.note_path(conn, :update, note), note: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.note_path(conn, :show, id))

      assert %{
               "id" => id,
               "album" => "some updated album",
               "artist" => "some updated artist",
               "details" => "some updated details",
               "download_path" => "some updated download_path",
               "download_url" => "some updated download_url",
               "kind" => "some updated kind",
               "release_date" => "2011-05-18"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, note: note} do
      conn = put(conn, Routes.note_path(conn, :update, note), note: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete note" do
    setup [:create_note]

    test "deletes chosen note", %{conn: conn, note: note} do
      conn = delete(conn, Routes.note_path(conn, :delete, note))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.note_path(conn, :show, note))
      end
    end
  end

  defp create_note(_) do
    note = fixture(:note)
    {:ok, note: note}
  end
end
