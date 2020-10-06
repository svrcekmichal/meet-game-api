defmodule MeetGameWeb.TopicView do
  use MeetGameWeb, :view
  alias MeetGameWeb.TopicView

  def render("index.json", %{forum_topics: forum_topics}) do
    %{data: render_many(forum_topics, TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id, title: topic.title}
  end
end
