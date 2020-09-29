defmodule MeetGame.Game.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
