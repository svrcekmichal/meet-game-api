defmodule MeetGameWeb.UserController do
  use MeetGameWeb, :controller

  alias MeetGame.Core
  alias MeetGame.Core.User

  action_fallback MeetGameWeb.FallbackController

  def index(conn, _params) do
    users = Core.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Core.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Core.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Core.get_user!(id)

    with {:ok, %User{} = user} <- Core.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Core.get_user!(id)

    with {:ok, %User{}} <- Core.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
