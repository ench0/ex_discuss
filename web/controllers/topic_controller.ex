defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    struct = %Topic{} #because of alias, instead of: struct = %Discuss.Topic{}
    params = %{}
    changeset = Topic.changeset(struct, params) #because of alias, instead of: changeset = Discuss.Topic.changeset(struct, params)
    #or shorter: changeset = Topic.changeset(%Topic{}, %{})

    sum = 1 + 1

    render conn, "new.html", changeset: changeset, sum: sum, error: ""
    #IO.puts "*****"
    #IO.inspect conn
    #IO.puts "*****"
    #IO.inspect _params
    #IO.puts "*****"
  end

#  def create(conn, params) do
#    #IO.inspect params
#    %{"topic" => topic} = params
#  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    sum = 2 + 2

    case Repo.insert changeset do
      #{:ok, post} -> IO.inspect(post)
      {:ok, post} ->
        render conn, "list.html", changeset: changeset, sum: sum, error: :error
      #{:error, changeset} -> IO.inspect(changeset)
      {:error, changeset} -> 
        render conn, "new.html", changeset: changeset, sum: sum, error: :error
    end
  end

  def list(conn, _params) do
    render conn, "list.html"
  end

end
