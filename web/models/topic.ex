defmodule Discuss.Topic do
    use Discuss.Web, :model
    # use Ecto.Schema

    schema "topics" do
        field :title, :string

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title, :inserted_at, :updated_at])
        |> validate_required([:title])
        |> validate_length(:title, min: 3)
    end

end