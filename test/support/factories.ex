defmodule MeetGame.Factory do
  use ExMachina.Ecto, repo: MeetGame.Repo

  def user_factory do
    %MeetGame.Core.User{
      username: Faker.Person.first_name() <> Faker.Person.last_name()
    }
  end
end
