defmodule PhenixSampleWeb.PageController do
  use PhenixSampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
