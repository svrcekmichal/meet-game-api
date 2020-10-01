defmodule MeetGameWeb.Resolvers.Core do

  def logged_user(_parent, _args, %{context: %{user: user}}) do
    {:ok, user}
  end
  def logged_user(_parent, _args, _resolution), do: {:ok, nil}


  def list_users(_parent, _args, _resolution) do
    {:ok, MeetGame.Core.list_users()}
  end

end
