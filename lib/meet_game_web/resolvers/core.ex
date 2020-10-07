defmodule MeetGameWeb.Resolvers.Core do
  alias Absinthe.Relay.Connection
  alias MeetGame.Core
  alias MeetGame.Forum
  alias MeetGame.Repo
  alias MeetGameWeb.Resolvers.Helpers

  def create_user(_parent, %{username: username}, _resolution) do
    case Core.create_user(%{username: username}) do
      {:ok, user} -> {:ok, %{created_user: user}}
      {:error, changeset} -> {:error, Helpers.extract_error_msg(changeset)}
      _ -> {:error, "Something failed? :D"}
    end
  end

  def logged_user(_parent, _args, %{context: %{user: user}}) do
    {:ok, user}
  end

  def logged_user(_parent, _args, _resolution), do: {:ok, nil}

  def list_users(_parent, _args, _resolution) do
    {:ok, Core.list_users()}
  end

  def user_topics_connection(%{id: id}, args, _resolution) do
    Forum.query_user_topics(id)
    |> Connection.from_query(&Repo.all/1, args)
  end
end
