defmodule TodoMVCWeb.MainView do
  use TodoMVCWeb, :view

  def todo_classes(todo) do
    [
      if(todo.editing, do: "editing"),
      if(todo.state == "completed", do: "completed")
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end

  def all_todos_completed?(todos) do
    !Enum.any?(todos, fn t -> t.state == "active" end)
  end

  def selected_class(filter, filter), do: "selected"
  def selected_class(_current_filter, _filter), do: ""

  def todo_visible?(_todo, "all"), do: true
  def todo_visible?(%{state: state}, state), do: true
  def todo_visible?(_, _), do: false

  def left_count_label(todos) do
    ngettext(
      "1 item left",
      "%{count} items left",
      Enum.count(todos, fn t -> t.state == "active" end)
    )
  end
end
