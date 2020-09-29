defmodule MeetGame.Game.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
