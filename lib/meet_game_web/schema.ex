defmodule MeetGameWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(Absinthe.Type.Custom)
  import_types(MeetGameWeb.Schema.CoreTypes)
  import_types(MeetGameWeb.Schema.ForumTypes)

  query do
    import_fields(:core_queries)
    import_fields(:forum_queries)
  end

  mutation do
    import_fields(:core_mutations)
    import_fields(:forum_mutations)
  end

  subscription do
    import_fields(:forum_subscriptions)
  end
end
