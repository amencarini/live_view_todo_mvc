defmodule TodoMVCWeb.PageController do
  use TodoMVCWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
