defmodule PhenixSampleWeb.PageView do
  use PhenixSampleWeb, :view

  # Define Functions 
  def handler_info(conn) do
    "コントローラ名 / アクション名：#{controller_module conn} / #{action_name conn}"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end

end
