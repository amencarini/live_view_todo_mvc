defmodule TodoMVCWeb.MainLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(TodoMVCWeb.MainView, "index.html", assigns)
  end
end
