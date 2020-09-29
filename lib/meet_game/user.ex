defmodule MeetGame.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MeetGame.Message

  schema "users" do
    field :username, :string
    field :email, :string
    has_many :messages, Message, foreign_key: :author_id
    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
