defmodule MeetGameWeb.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types MeetGameWeb.Schema.CoreTypes
  import_types MeetGameWeb.Schema.ForumTypes

  query do
    import_fields(:core_queries)
  end

  mutation do
    import_fields(:core_mutations)
  end

end
