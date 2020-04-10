defmodule ParamSampleWeb.Router do
  use ParamSampleWeb, :router

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

  scope "/", ParamSampleWeb do
    pipe_through :browser

    get "/", PageController, :new
    post "/create", PageController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", ParamSampleWeb do
  #   pipe_through :api
  # end
end
