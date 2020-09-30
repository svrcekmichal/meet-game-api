defmodule MeetGame.Repo.Migrations.CreateForumTopics do
  use Ecto.Migration

  def change do
    create table(:forum_topics) do
      add :title, :string
      add :author_id, references(:users), null: false
      timestamps()
    end

  end
end
