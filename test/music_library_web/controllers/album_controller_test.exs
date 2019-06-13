defmodule MusicLibraryWeb.AlbumControllerTest do
  use MusicLibraryWeb.ConnCase

  alias MusicLibrary.Catalog
  alias MusicLibrary.Catalog.Album

  @create_attrs %{
    album_artist: "some album_artist",
    compoeser: "some compoeser",
    cover: "some cover",
    mb_id: "some mb_id",
    path: "some path",
    title: "some title",
    year: 42
  }
  @update_attrs %{
    album_artist: "some updated album_artist",
    compoeser: "some updated compoeser",
    cover: "some updated cover",
    mb_id: "some updated mb_id",
    path: "some updated path",
    title: "some updated title",
    year: 43
  }
  @invalid_attrs %{album_artist: nil, compoeser: nil, cover: nil, mb_id: nil, path: nil, title: nil, year: nil}

  def fixture(:album) do
    {:ok, album} = Catalog.create_album(@create_attrs)
    album
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all albums", %{conn: conn} do
      conn = get(conn, Routes.album_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create album" do
    test "renders album when data is valid", %{conn: conn} do
      conn = post(conn, Routes.album_path(conn, :create), album: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.album_path(conn, :show, id))

      assert %{
               "id" => id,
               "album_artist" => "some album_artist",
               "compoeser" => "some compoeser",
               "cover" => "some cover",
               "mb_id" => "some mb_id",
               "path" => "some path",
               "title" => "some title",
               "year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.album_path(conn, :create), album: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update album" do
    setup [:create_album]

    test "renders album when data is valid", %{conn: conn, album: %Album{id: id} = album} do
      conn = put(conn, Routes.album_path(conn, :update, album), album: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.album_path(conn, :show, id))

      assert %{
               "id" => id,
               "album_artist" => "some updated album_artist",
               "compoeser" => "some updated compoeser",
               "cover" => "some updated cover",
               "mb_id" => "some updated mb_id",
               "path" => "some updated path",
               "title" => "some updated title",
               "year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, album: album} do
      conn = put(conn, Routes.album_path(conn, :update, album), album: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete album" do
    setup [:create_album]

    test "deletes chosen album", %{conn: conn, album: album} do
      conn = delete(conn, Routes.album_path(conn, :delete, album))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.album_path(conn, :show, album))
      end
    end
  end

  defp create_album(_) do
    album = fixture(:album)
    {:ok, album: album}
  end
end
