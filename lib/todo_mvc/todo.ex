defmodule TodoMVC.Todo do
  @enforce_keys [:id, :text, :state]
  defstruct [:id, :text, :state, :editing]

  alias TodoMVC.Todo

  @type t :: %Todo{}

  @spec new(binary()) :: Todo.t()
  def new(text) do
    %Todo{id: UUID.uuid4(), text: text, state: "active"}
  end

  @spec toggle(Todo.t()) :: Todo.t()
  def toggle(%Todo{state: "active"} = todo), do: complete(todo)
  def toggle(%Todo{state: "completed"} = todo), do: activate(todo)

  @spec complete(Todo.t()) :: Todo.t()
  def complete(todo), do: %{todo | state: "completed"}

  @spec activate(Todo.t()) :: Todo.t()
  def activate(todo), do: %{todo | state: "active"}
end
