defmodule MeetGameWeb.Schema.CoreTypes do
  use Absinthe.Schema.Notation

  @desc "Core.User"
  object :user do
    field :id, :id
    field :username, :string

    # field :inserted_at, :naive_datetime
  end

end
