defmodule MeetGameWeb.Schema do
  use Absinthe.Schema

  import_types MeetGameWeb.Schema.CoreTypes
  import_types MeetGameWeb.Schema.ForumTypes

  alias MeetGameWeb.Resolvers

  query do

    @desc "Logged User"
    field :logged_user, :user do
      resolve &Resolvers.Core.logged_user/3
    end

    @desc "Get all user"
    field :users, list_of(:user) do
      resolve &Resolvers.Core.list_users/3
    end

  end

end
