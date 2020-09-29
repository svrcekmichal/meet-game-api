defmodule MeetGame.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias MeetGame.{ User }

  schema "users" do
    field :raw_text, :string
    belongs_to :author, User, foreign_key: :author_id
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
