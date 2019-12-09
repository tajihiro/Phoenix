defmodule ReactPhoenixReduxWeb.Router do
  use ReactPhoenixReduxWeb, :router

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

  scope "/", ReactPhoenixReduxWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", ReactPhoenixReduxWeb do
     pipe_through :api
     resources "/members", MemberController, except: [:new, :edit]
   end
end
