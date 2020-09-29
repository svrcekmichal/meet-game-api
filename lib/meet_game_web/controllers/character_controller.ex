defmodule MeetGameWeb.CharacterController do
  use MeetGameWeb, :controller

  alias MeetGame.Game
  alias MeetGame.Game.Character

  action_fallback MeetGameWeb.FallbackController

  def index(conn, _params) do
    characters = Game.list_characters()
    render(conn, "index.json", characters: characters)
  end

  def create(conn, %{"character" => character_params}) do
    with {:ok, %Character{} = character} <- Game.create_character(character_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.character_path(conn, :show, character))
      |> render("show.json", character: character)
    end
  end

  def show(conn, %{"id" => id}) do
    character = Game.get_character!(id)
    render(conn, "show.json", character: character)
  end

  def update(conn, %{"id" => id, "character" => character_params}) do
    character = Game.get_character!(id)

    with {:ok, %Character{} = character} <- Game.update_character(character, character_params) do
      render(conn, "show.json", character: character)
    end
  end

  def delete(conn, %{"id" => id}) do
    character = Game.get_character!(id)

    with {:ok, %Character{}} <- Game.delete_character(character) do
      send_resp(conn, :no_content, "")
    end
  end
end
