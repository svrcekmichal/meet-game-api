defmodule MeetGameWeb.TopicController do
  use MeetGameWeb, :controller

  alias MeetGame.Forum
  alias MeetGame.Forum.Topic

  action_fallback MeetGameWeb.FallbackController

  def index(conn, _params) do
    forum_topics = Forum.list_topics()
    render(conn, "index.json", forum_topics: forum_topics)
  end

  def create(conn, %{"topic" => topic_params}) do
    with {:ok, %Topic{} = topic} <- Forum.create_topic(topic_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.topic_path(conn, :show, topic))
      |> render("show.json", topic: topic)
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Forum.get_topic!(id)
    render(conn, "show.json", topic: topic)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Forum.get_topic!(id)

    with {:ok, %Topic{} = topic} <- Forum.update_topic(topic, topic_params) do
      render(conn, "show.json", topic: topic)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Forum.get_topic!(id)

    with {:ok, %Topic{}} <- Forum.delete_topic(topic) do
      send_resp(conn, :no_content, "")
    end
  end
end
