defmodule MusicLibrary.CatalogTest do
  use MusicLibrary.DataCase

  alias MusicLibrary.Catalog

  describe "artists" do
    alias MusicLibrary.Catalog.Artist

    @valid_attrs %{image: "some image", mbid: "some mbid", name: "some name", path: "some path"}
    @update_attrs %{image: "some updated image", mbid: "some updated mbid", name: "some updated name", path: "some updated path"}
    @invalid_attrs %{image: nil, mbid: nil, name: nil, path: nil}

    def artist_fixture(attrs \\ %{}) do
      {:ok, artist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_artist()

      artist
    end

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Catalog.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Catalog.get_artist!(artist.id) == artist
    end

    test "create_artist/1 with valid data creates a artist" do
      assert {:ok, %Artist{} = artist} = Catalog.create_artist(@valid_attrs)
      assert artist.image == "some image"
      assert artist.mbid == "some mbid"
      assert artist.name == "some name"
      assert artist.path == "some path"
    end

    test "create_artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_artist(@invalid_attrs)
    end

    test "update_artist/2 with valid data updates the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{} = artist} = Catalog.update_artist(artist, @update_attrs)
      assert artist.image == "some updated image"
      assert artist.mbid == "some updated mbid"
      assert artist.name == "some updated name"
      assert artist.path == "some updated path"
    end

    test "update_artist/2 with invalid data returns error changeset" do
      artist = artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_artist(artist, @invalid_attrs)
      assert artist == Catalog.get_artist!(artist.id)
    end

    test "delete_artist/1 deletes the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{}} = Catalog.delete_artist(artist)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_artist!(artist.id) end
    end

    test "change_artist/1 returns a artist changeset" do
      artist = artist_fixture()
      assert %Ecto.Changeset{} = Catalog.change_artist(artist)
    end
  end

  describe "albums" do
    alias MusicLibrary.Catalog.Album

    @valid_attrs %{album_artist: "some album_artist", compoeser: "some compoeser", cover: "some cover", mb_id: "some mb_id", path: "some path", title: "some title", year: 42}
    @update_attrs %{album_artist: "some updated album_artist", compoeser: "some updated compoeser", cover: "some updated cover", mb_id: "some updated mb_id", path: "some updated path", title: "some updated title", year: 43}
    @invalid_attrs %{album_artist: nil, compoeser: nil, cover: nil, mb_id: nil, path: nil, title: nil, year: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Catalog.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Catalog.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Catalog.create_album(@valid_attrs)
      assert album.album_artist == "some album_artist"
      assert album.compoeser == "some compoeser"
      assert album.cover == "some cover"
      assert album.mb_id == "some mb_id"
      assert album.path == "some path"
      assert album.title == "some title"
      assert album.year == 42
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, %Album{} = album} = Catalog.update_album(album, @update_attrs)
      assert album.album_artist == "some updated album_artist"
      assert album.compoeser == "some updated compoeser"
      assert album.cover == "some updated cover"
      assert album.mb_id == "some updated mb_id"
      assert album.path == "some updated path"
      assert album.title == "some updated title"
      assert album.year == 43
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_album(album, @invalid_attrs)
      assert album == Catalog.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Catalog.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Catalog.change_album(album)
    end
  end

  describe "tracks" do
    alias MusicLibrary.Catalog.Track

    @valid_attrs %{length: 42, mb_id: "some mb_id", number: 42, path: "some path", size: 42, title: "some title"}
    @update_attrs %{length: 43, mb_id: "some updated mb_id", number: 43, path: "some updated path", size: 43, title: "some updated title"}
    @invalid_attrs %{length: nil, mb_id: nil, number: nil, path: nil, size: nil, title: nil}

    def track_fixture(attrs \\ %{}) do
      {:ok, track} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_track()

      track
    end

    test "list_tracks/0 returns all tracks" do
      track = track_fixture()
      assert Catalog.list_tracks() == [track]
    end

    test "get_track!/1 returns the track with given id" do
      track = track_fixture()
      assert Catalog.get_track!(track.id) == track
    end

    test "create_track/1 with valid data creates a track" do
      assert {:ok, %Track{} = track} = Catalog.create_track(@valid_attrs)
      assert track.length == 42
      assert track.mb_id == "some mb_id"
      assert track.number == 42
      assert track.path == "some path"
      assert track.size == 42
      assert track.title == "some title"
    end

    test "create_track/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_track(@invalid_attrs)
    end

    test "update_track/2 with valid data updates the track" do
      track = track_fixture()
      assert {:ok, %Track{} = track} = Catalog.update_track(track, @update_attrs)
      assert track.length == 43
      assert track.mb_id == "some updated mb_id"
      assert track.number == 43
      assert track.path == "some updated path"
      assert track.size == 43
      assert track.title == "some updated title"
    end

    test "update_track/2 with invalid data returns error changeset" do
      track = track_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_track(track, @invalid_attrs)
      assert track == Catalog.get_track!(track.id)
    end

    test "delete_track/1 deletes the track" do
      track = track_fixture()
      assert {:ok, %Track{}} = Catalog.delete_track(track)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_track!(track.id) end
    end

    test "change_track/1 returns a track changeset" do
      track = track_fixture()
      assert %Ecto.Changeset{} = Catalog.change_track(track)
    end
  end
end
