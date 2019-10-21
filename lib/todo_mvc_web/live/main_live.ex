defmodule TodoMVCWeb.MainLive do
  use Phoenix.LiveView

  alias TodoMVC.Todo

  def render(assigns) do
    Phoenix.View.render(TodoMVCWeb.MainView, "index.html", assigns)
  end

  def mount(_params, socket) do
    {:ok, assign(socket, todos: [], filter: "all")}
  end

  def handle_params(%{"filter" => filter}, _uri, socket) do
    {:noreply, assign(socket, filter: filter)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def handle_event("add-todo", %{"text" => ""}, socket) do
    {:noreply, socket}
  end

  def handle_event("add-todo", %{"text" => text}, socket) do
    todos = socket.assigns[:todos] ++ [Todo.new(text)]

    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("destroy", %{"todo-id" => id}, socket) do
    todos = socket.assigns[:todos] |> Enum.reject(fn t -> t.id == id end)

    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("toggle", %{"todo-id" => id}, socket) do
    toggle = fn
      %Todo{id: ^id} = todo -> Todo.toggle(todo)
      todo -> todo
    end

    todos = socket.assigns[:todos] |> Enum.map(toggle)

    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("toggle-all", %{"checked" => "false"}, socket) do
    todos = socket.assigns[:todos] |> Enum.map(&Todo.complete/1)

    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("toggle-all", _params, socket) do
    todos = socket.assigns[:todos] |> Enum.map(&Todo.activate/1)

    {:noreply, assign(socket, todos: todos)}
  end

  def handle_event("clear-completed", _params, socket) do
    todos = socket.assigns[:todos] |> Enum.reject(fn t -> t.state == "completed" end)

    {:noreply, assign(socket, todos: todos)}
  end
end
