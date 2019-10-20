defmodule TodoMVC.Todo do
  @enforce_keys [:id, :text, :state]
  defstruct [:id, :text, :state, :editing]

  @spec new(binary()) :: __MODULE__.t()
  def new(text) do
    %__MODULE__{id: UUID.uuid4(), text: text, state: "active"}
  end

  def toggle(%__MODULE__{state: "active"} = todo), do: complete(todo)
  def toggle(%__MODULE__{state: "completed"} = todo), do: activate(todo)

  def complete(todo), do: %{todo | state: "completed"}

  def activate(todo), do: %{todo | state: "active"}
end
