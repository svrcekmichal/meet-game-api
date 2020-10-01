defmodule MeetGameWeb.Resolvers.Helpers do

  def extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error),
        # details: details
      ]
    end)
  end

end
