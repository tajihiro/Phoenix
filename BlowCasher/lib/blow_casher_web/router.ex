defmodule BlowCasherWeb.Router do
  use BlowCasherWeb, :router

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

  scope "/", BlowCasherWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/groups", GroupController
    resources "/items", ItemController
    resources "/prices", PriceController
    resources "/sales", SalesController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlowCasherWeb do
  #   pipe_through :api
  # end
end
