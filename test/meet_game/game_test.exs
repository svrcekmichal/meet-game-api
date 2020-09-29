defmodule MeetGame.GameTest do
  use MeetGame.DataCase

  alias MeetGame.Game

  describe "players" do
    alias MeetGame.Game.Player

    @valid_attrs %{username: "some username"}
    @update_attrs %{username: "some updated username"}
    @invalid_attrs %{username: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Game.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Game.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Game.create_player(@valid_attrs)
      assert player.username == "some username"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Game.update_player(player, @update_attrs)
      assert player.username == "some updated username"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_player(player, @invalid_attrs)
      assert player == Game.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Game.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Game.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Game.change_player(player)
    end
  end

  describe "characters" do
    alias MeetGame.Game.Character

    @valid_attrs %{username: "some username"}
    @update_attrs %{username: "some updated username"}
    @invalid_attrs %{username: nil}

    def character_fixture(attrs \\ %{}) do
      {:ok, character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_character()

      character
    end

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Game.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Game.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      assert {:ok, %Character{} = character} = Game.create_character(@valid_attrs)
      assert character.username == "some username"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      assert {:ok, %Character{} = character} = Game.update_character(character, @update_attrs)
      assert character.username == "some updated username"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_character(character, @invalid_attrs)
      assert character == Game.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Game.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Game.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Game.change_character(character)
    end
  end
end
