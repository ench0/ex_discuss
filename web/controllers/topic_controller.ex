defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

#NEW
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

#CREATE
  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    sum = 2 + 2

    case Repo.insert changeset do
      {:ok, topic} ->
        IO.inspect(topic)
        conn
        |> put_flash(:info, "Topic \"" <> topic.title <> "\" Created")
        |> redirect(to: topic_path(conn, :index))
        #render conn, "index.html", changeset: changeset, sum: sum, error: :error
      #{:error, changeset} -> IO.inspect(changeset)
      {:error, changeset} -> 
        conn
        |> put_flash(:alert, "Something went wrong")#alert because we already used :error atom, needs change in the layout
        |> render "new.html", changeset: changeset, sum: sum, error: :error
    end
  end

#LIST
  def index(conn, _params) do
    # query = from t in Topic, limit: 3
    # topics = Repo.all query#, order_by: Topic.title, limit: 3
    topics = Repo.all from t in Topic, limit: 40, order_by: :title#id

    # timedisplay = topics.inserted_at
    IO.puts "+++++++"
    IO.inspect topics
    IO.puts "+++++++"

    render conn, "index.html", topics: topics#, timedisplay: timedisplay
  end

#EDIT
  def edit(conn, %{"id" => topic_id}) do #params = %{"id" => topic_id}
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic    
  end

#UPDATE
  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)#first argument in changeset is struct, existing record in our database, second argument is new attribute
    #changeset = Repo.get(Topic, topic_id) |> Topic.changeset(topic)#using pipe we simplify the above, but need old_topic var
    
    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Updated")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, topic: old_topic
    end

  end

#DELETE
  def delete(conn, %{"id" => topic_id}) do
    Repo.get!(Topic, topic_id) |> Repo.delete!#get! will return error message in case something is wrong

    conn
    |> put_flash(:info, "Topic Deleted")
    |> redirect(to: topic_path(conn, :index))
  end




  def timecalc(time) do
    time = Ecto.DateTime.cast!(time)
    # time = Ecto.DateTime.cast!("2016-09-05 13:30:18.367318")
    Ecto.DateTime.to_erl time
    # {{2016, 9, 5}, {13, 30, 18}}
  end

end
