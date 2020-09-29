defmodule MeetGame.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :username, :string

      timestamps()
    end

    create unique_index(:players, [:username])
  end
end
