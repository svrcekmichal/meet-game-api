defmodule MeetGameWeb.Plugs.SetUser do
  import Plug.Conn
  alias MeetGame.Core

  def init(_params) do
  end

  def call(conn, _params) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with [token] <- get_req_header(conn, "authorization"),
         user = Core.get_user!(token) do
      %{user: user}
    else
      _ -> %{user: nil}
    end
  end
end
