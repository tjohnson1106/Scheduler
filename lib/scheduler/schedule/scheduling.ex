defmodule Scheduler.Schedule.Scheduling do
  use Ecto.Schema
  import Ecto.Changeset
  alias Scheduler.Schedule.Scheduling

  schema "schedulings" do
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(scheduling, attrs) do
    scheduling
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
