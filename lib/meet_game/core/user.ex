defmodule MeetGame.Core.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MeetGame.Forum.Topic

  schema "users" do
    field :username, :string

    has_many :topics, Topic, foreign_key: :author_id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
