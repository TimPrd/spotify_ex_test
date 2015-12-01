defmodule SpotifyExTest.Router do
  use SpotifyExTest.Web, :router

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

  scope "/", SpotifyExTest do
    pipe_through :browser # Use the default browser stack

    get "/", PlaylistController, :index
    get "/authorize", AuthorizationController, :authorize
    get "/authenticate", AuthenticationController, :authenticate
  end

  # Other scopes may use custom stacks.
  # scope "/api", SpotifyExTest do
  #   pipe_through :api
  # end
end
