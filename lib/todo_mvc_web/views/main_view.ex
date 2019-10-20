defmodule TodoMVCWeb.MainView do
  use TodoMVCWeb, :view

  def todo_classes(%TodoMVC.Todo{state: "completed"}), do: "completed"
  def todo_classes(_), do: ""
end
