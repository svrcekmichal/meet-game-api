defmodule MeetGameWeb.Resolvers.Core do

  def list_users(_parent, _args, _resolution) do
    {:ok, MeetGame.Core.list_users()}
  end

end
