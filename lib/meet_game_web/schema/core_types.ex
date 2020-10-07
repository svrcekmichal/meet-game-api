defmodule MeetGameWeb.Schema.CoreTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias Absinthe.Relay.Connection

  import Ecto.Query
  alias MeetGame.Repo
  alias MeetGame.Forum.Topic
  alias MeetGameWeb.Resolvers

  object :core_queries do
    @desc "Logged User"
    field :logged_user, :user do
      resolve(&Resolvers.Core.logged_user/3)
    end

    @desc "Get all user"
    field :users, list_of(:user) do
      resolve(&Resolvers.Core.list_users/3)
    end
  end

  object :core_mutations do
    @desc "Create new user"
    field :create_user, :create_user_result do
      arg(:username, non_null(:string))
      resolve(&Resolvers.Core.create_user/3)
    end
  end

  @desc "Core.User"
  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
    field :inserted_at, :naive_datetime

    connection field :topics_connection, node_type: :topic do
      resolve(&Resolvers.Core.user_topics_connection/3)
    end
  end

  @desc "Result of Mutation.createUser"
  object :create_user_result do
    field :created_user, non_null(:user)
  end
end
