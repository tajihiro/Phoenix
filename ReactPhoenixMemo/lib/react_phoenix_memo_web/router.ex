defmodule ReactPhoenixMemoWeb.Router do
  use ReactPhoenixMemoWeb, :router

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

  scope "/", ReactPhoenixMemoWeb do
    pipe_through :browser

    get "/", MemoController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReactPhoenixMemoWeb do
  #   pipe_through :api
  # end
end
