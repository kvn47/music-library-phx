defmodule MusicLibraryWeb.Router do
  use MusicLibraryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MusicLibraryWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", MusicLibraryWeb do
     pipe_through :api

     get "/settings", SettingController, :index
     resources "/artists", ArtistController, except: [:new, :edit]
     resources "/albums", AlbumController, except: [:new, :edit]
     resources "/tracks", TrackController, except: [:new, :edit]
     resources "/notes", NoteController, except: [:new, :edit]
   end
end
