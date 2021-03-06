defmodule BaseballWeb.Router do
  use BaseballWeb, :router

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

  scope "/", BaseballWeb do
    pipe_through :browser

    get "/", MemberController, :index

    resources "/members", MemberController
    resources "/teams", TeamController

  end

  # Other scopes may use custom stacks.
  # scope "/api", BaseballWeb do
  #   pipe_through :api
  # end
end
