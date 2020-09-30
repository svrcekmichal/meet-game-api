defmodule MeetGameWeb.Schema.ForumTypes do
  use Absinthe.Schema.Notation

  @desc "Forum.Topic"
  object :topic do
    field :id, non_null(:id)
    field :title, non_null(:string)
    # field :inserted_at, :naive_datetime
  end

end
