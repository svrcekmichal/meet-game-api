defmodule MeetGame.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:message) do
      add :raw_text, :string
      add :author_id, references(:users), null: false
      timestamps()
    end
  end
end
