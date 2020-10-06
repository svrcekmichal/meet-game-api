defmodule MeetGame.Forum.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias MeetGame.Core.User

  schema "forum_topics" do
    field :title, :string
    field :description, :string

    belongs_to :author, User, foreign_key: :author_id

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title, :description, :author_id])
    |> validate_required([:title, :description, :author_id])
  end
end
