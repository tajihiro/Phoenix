defmodule FileUploadWeb.Router do
  use FileUploadWeb, :router

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

  scope "/", FileUploadWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/upload", PageController, :upload
  end

  # Other scopes may use custom stacks.
  # scope "/api", FileUploadWeb do
  #   pipe_through :api
  # end
end
