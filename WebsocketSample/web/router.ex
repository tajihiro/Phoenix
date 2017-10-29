defmodule WebsocketSample.Router do
  use WebsocketSample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug MyAuth
    # plug :put_user_token
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebsocketSample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", WebsocketSample do
  #   pipe_through :api
  # end

  # defp put_user_token(conn, _) do
  #   if current_user = conn.assigns[:current_user] do
  #     token = Phoenix.Token.sign(conn, "user socket", current_user.id)
  #     assign(conn, :user_token, token)
  #   else
  #     conn
  #   end
  # end
end
