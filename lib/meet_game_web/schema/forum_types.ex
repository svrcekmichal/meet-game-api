defmodule MeetGameWeb.Schema.ForumTypes do
  use Absinthe.Schema.Notation
  alias MeetGameWeb.Resolvers
  use Ecto.Schema

  object :forum_queries do
    @desc "Get all forum topics"
    field :topics, list_of(:topic) do
      resolve(&Resolvers.Forum.list_topics/3)
    end
  end

  object :forum_mutations do
    @desc "Create new topic associated to logged user"
    field :create_topic, :create_topic_result do
      arg(:title, non_null(:string))
      arg(:description, non_null(:string))
      resolve(&Resolvers.Forum.create_topic/3)
    end
  end

  @desc "Result of Mutation.createTopic"
  object :create_topic_result do
    field :created_topic, non_null(:topic)
  end

  @desc "Forum.Topic"
  object :topic do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)

    field :author, :user do
      arg(:date, :date)
      resolve(&Resolvers.Forum.get_author/3)
    end

    field :inserted_at, :naive_datetime
  end
end
