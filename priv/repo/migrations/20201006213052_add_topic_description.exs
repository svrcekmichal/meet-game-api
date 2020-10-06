defmodule MeetGame.Repo.Migrations.AddTopicDescriptionAndAuthor do
  use Ecto.Migration

  def change do
    alter table(:forum_topics) do
      add :description, :string, null: false
    end
  end
end
