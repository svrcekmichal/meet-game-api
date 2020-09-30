defmodule MeetGameWeb.Schema.CoreTypes do
  use Absinthe.Schema.Notation

  @desc "Core.User"
  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)

    # field :inserted_at, :naive_datetime
  end

end
