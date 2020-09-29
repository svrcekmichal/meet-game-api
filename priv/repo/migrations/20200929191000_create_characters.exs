defmodule MeetGame.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :username, :string

      timestamps()
    end

    create unique_index(:characters, [:username])
  end
end
