defmodule TodoMVCWeb.MainView do
  use TodoMVCWeb, :view

  alias TodoMVC.Todo

  def todo_classes(%Todo{state: "completed"}), do: "completed"
  def todo_classes(_), do: ""

  def all_todos_completed?(todos) do
    !Enum.any?(todos, fn t -> t.state == "active" end)
  end
end
