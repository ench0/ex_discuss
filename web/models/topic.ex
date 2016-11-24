defmodule Discuss.Topic do
    use Discuss.Web, :model

    schema "topics" do
        field :title, :string

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title, :inserted_at])
        |> validate_required([:title])
        |> validate_length(:title, min: 3)
    end

end