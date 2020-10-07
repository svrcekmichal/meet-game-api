defmodule MeetGameWeb.Resolvers.Forum do
  alias MeetGame.{Forum, Core, Repo}
  alias MeetGameWeb.Resolvers.Helpers
  alias Absinthe.Relay.Connection

  def list_topics(_parent, _args, _resolution) do
    {:ok, Forum.list_topics()}
  end

  def get_author(parent, _, _) do
    IO.inspect(parent)
    {:ok, Core.get_user!(parent.author_id)}
  end

  def create_topic(_parent, _args, %{context: %{user: nil}}),
    do: {:error, "You must be logged in to create new topic"}

  def create_topic(_parent, args, %{context: %{user: user}}) do
    fields =
      args
      |> Map.put(:author_id, user.id)

    case Forum.create_topic(fields) do
      {:ok, topic} -> {:ok, %{created_topic: topic}}
      {:error, changeset} -> {:error, Helpers.extract_error_msg(changeset)}
      _ -> {:error, "Something failed? :D"}
    end
  end

  def user_topics_connection(%{id: id}, args, _resolution) do
    Forum.query_user_topics(id)
    |> Connection.from_query(&Repo.all/1, args)
  end

  def all_topics_connection(_parent, args, _resolution) do
    Forum.query_all_topics()
    |> Connection.from_query(&Repo.all/1, args)
  end
end
