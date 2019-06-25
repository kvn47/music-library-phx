defmodule MusicLibraryWeb.Plugs.Static do
  @behaviour Plug
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts), do: send_file(conn, 200, "priv/pwa/index.html")

#  @moduledoc false
#
#  use Plug.Builder
#
#  plug Plug.Static,
#     at: "/",
#     from: "priv/static"
##     gzip: false,
#
#   plug :not_found
#
#   def not_found(conn, _) do
#    send_file(conn, 200, "priv/static/index.html")
#  end
end
