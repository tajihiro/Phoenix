defmodule FileUploadWeb.PageController do
  use FileUploadWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def upload(conn, params) do
    path_upload = params["photo"]
    File.cp(path_upload.path, Path.absname("upload/#{path_upload.filename}"))
    render(conn, "index.html")
  end
end
