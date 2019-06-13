defmodule MusicLibraryWeb.SettingController do
  use MusicLibraryWeb, :controller

  def index(conn, _params) do
    json(conn, %{library_path: ""})
  end
end
