defmodule TodoMVC.Todo do
  @enforce_keys [:id, :text, :state]
  defstruct [:id, :text, :state, :editing]

  @spec new(binary()) :: __MODULE__.t()
  def new(text) do
    %__MODULE__{id: UUID.uuid4(), text: text, state: "active"}
  end

  # @spec toggle(__MODULE__.t()) :: __MODULE__.t()
  # def toggle(todo) do
  #   new_state =
  #     case todo.state do
  #       "completed" -> "active"
  #       "active" -> "completed"
  #     end

  #   %{todo | state: new_state}
  # end

  # @spec complete(__MODULE__.t()) :: __MODULE__.t()
  # def complete(todo) do
  #   %{todo | state: "completed"}
  # end

  # @spec activate(__MODULE__.t()) :: __MODULE__.t()
  # def activate(todo) do
  #   %{todo | state: "active"}
  # end
end
