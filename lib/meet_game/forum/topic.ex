defmodule MeetGame.Forum.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias MeetGame.Core.User

  schema "forum_topics" do
    field :title, :string

    belongs_to :author, User, foreign_key: :author_id

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
