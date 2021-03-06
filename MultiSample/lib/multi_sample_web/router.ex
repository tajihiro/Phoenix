defmodule MultiSampleWeb.Router do
  use MultiSampleWeb, :router

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

  scope "/", MultiSampleWeb do
    pipe_through :browser

    get "/", PageController, :new
    post "/", PageController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", MultiSampleWeb do
  #   pipe_through :api
  # end
end
