defmodule TodoMVCWeb.MainView do
  use TodoMVCWeb, :view

  alias TodoMVC.Todo

  @spec todo_classes(Todo.t()) :: binary
  def todo_classes(todo) do
    [
      if(todo.editing, do: "editing"),
      if(todo.state == "completed", do: "completed")
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end

  @spec all_todos_completed?([Todo.t()]) :: boolean
  def all_todos_completed?(todos) do
    !Enum.any?(todos, fn t -> t.state == "active" end)
  end

  @spec selected_class(binary, binary) :: binary
  def selected_class(filter, filter), do: "selected"
  def selected_class(_current_filter, _filter), do: ""

  @spec todo_visible?(Todo.t(), binary) :: boolean
  def todo_visible?(_todo, "all"), do: true
  def todo_visible?(%{state: state}, state), do: true
  def todo_visible?(_, _), do: false

  @spec left_count_label([Todo.t()]) :: binary
  def left_count_label(todos) do
    ngettext(
      "1 item left",
      "%{count} items left",
      Enum.count(todos, fn t -> t.state == "active" end)
    )
  end
end
