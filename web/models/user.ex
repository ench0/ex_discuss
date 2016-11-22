defmodule Discuss.User do
    use Discuss.Web, :model

    schema "users" do
        field :email, :string
        field :provider, :string
        field :token, :string
        field :uname, :string
        field :fname, :string
        field :lname, :string
        field :nname, :string

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:email, :provider, :token, :uname, :fname, :lname, :nname])
        |> validate_required([:email, :provider, :token, :uname, :nname])
    end

end