defmodule MeetGameWeb.Schema.ForumTypes do
  use Absinthe.Schema.Notation

  @desc "Forum.Topic"
  object :topic do
    field :id, :id
    field :title, :string
    # field :inserted_at, :naive_datetime
  end

end
