defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  use Timex

  alias Discuss.Topic

#NEW
  def new(conn, _params) do
    struct = %Topic{} #because of alias, instead of: struct = %Discuss.Topic{}
    params = %{}
    changeset = Topic.changeset(struct, params) #because of alias, instead of: changeset = Discuss.Topic.changeset(struct, params)
    #or shorter: changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset, error: ""
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
    insert_or_update_topic(changeset)


    case Repo.insert changeset do
      {:ok, topic} ->
        IO.inspect(topic)
        conn
        |> put_flash(:info, "Topic \"" <> topic.title <> "\" Created")
        |> redirect(to: topic_path(conn, :index))
        #render conn, "index.html", changeset: changeset, error: :error
      #{:error, changeset} -> IO.inspect(changeset)
      {:error, changeset} -> 
        conn
        |> put_flash(:alert, "Something went wrong")#alert because we already used :error atom, needs change in the layout
        |> render "new.html", changeset: changeset, error: :error
    end
  end

  defp insert_or_update_topic(changeset) do#helper function (private) for authcontroller
      IO.puts "+++++-----+++++"
      IO.inspect(changeset.changes.title)
      IO.puts "+++++-----+++++"
 
      case Repo.get_by(Topic, title: changeset.changes.title) do#User is model, email is search criteria
          nil ->
              Repo.insert(changeset)
          topic ->
              {:ok, topic}
      end
  end





#LIST
  def index(conn, _params) do
    IO.puts "+++++++tc list"
    IO.inspect conn.assigns
    IO.puts "+++++++"


    # query = from t in Topic, limit: 3
    # topics = Repo.all query#, order_by: Topic.title, limit: 3
    # topics = Repo.all from t in Topic, limit: 40, order_by: :title#id

    topics = Topic
    # |> where([p], p.age > 30)
    # |> order_by(asc: :title)
    |> order_by(asc: :inserted_at)
    # |> preload(:friends)
    # |> Repo.paginate(page: 1, page_size: 5)
    |> Repo.paginate(_params)
    # |> Map.put(:number, counter)
    # |> Map.put(:id, counter)

    input = 0
    counter = counter(input)


    render conn, "index.html", topics: topics, counter: counter,
          page_number: topics.page_number,
          page_size: topics.page_size,
          total_pages: topics.total_pages,
          total_entries: topics.total_entries#, timedisplay: timedisplay
  end

#EDIT
  def edit(conn, %{"id" => topic_id}) do #params = %{"id" => topic_id}
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)



    #datetime = {2016, 11, 20}
    #topic = Map.put(topic, :datetime, datetime)
    IO.puts "+++++++"
    IO.inspect changeset
    IO.puts "+++++++"


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




  def counter(input) do
    input = input + 1
    IO.puts input
  end



end
