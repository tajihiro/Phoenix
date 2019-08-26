defmodule AcCountWeb.ACCountController do
  use AcCountWeb, :controller

  def api(conn, _params) do
    render(conn, "ac_count.json", api_data: _params)
  end
end
