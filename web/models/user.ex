defmodule Discuss.User do
    use Discuss.Web, :model

    schema "users" do
        field :email, :string
        #field :provider, :string
        field :token, :string
        field :uname, :string
        field :fname, :string
        field :lname, :string
        field :nname, :string
        has_many :topics, Discuss.Topic
        has_many :comments, Discuss.Comment

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:email, :token, :uname, :fname, :lname, :nname])
        |> validate_required([:uname])
    end

end