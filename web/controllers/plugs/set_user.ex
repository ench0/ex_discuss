defmodule Discuss.Plugs.SetUser do
    import Plug.Conn #helper funcs to work with conn object
    import Phoenix.Controller #to do with sessions

    alias Discuss.Repo
    alias Discuss.User
    #alias Discuss.Router.Helpers#not needed

    def init(_params) do
    end

    def call(conn, _params) do #_params is the return value from the init function
        user_id = get_session(conn, :user_id) #opposite of put_session

        cond do
            user = user_id && Repo.get(User, user_id) -> #right side will be assigned to user variable if exists, otherwise left
                assign(conn, :user, user) #assign is function to modify the connection object, conn.assigns reads connection
            true ->
                assign(conn, :user, nil) #user not signed in
        end
    end
end