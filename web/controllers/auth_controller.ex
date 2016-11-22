defmodule Discuss.AuthController do
    use Discuss.Web, :controller
    plug Ueberauth

    alias Discuss.User#so we can use User.xxx

    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do#callback function is related to Ueberauth, nothing to do with Phoenix
        # IO.puts "*****"
        # IO.inspect(conn.assigns)
        # IO.puts "*****"
        # IO.inspect(params)
        IO.puts "*****"
        IO.inspect(auth)
        user_params = %{token: auth.credentials.token,
                        email: auth.info.email,
                        provider: auth.provider,
                        uname: auth.info.name,
                        fname: auth.info.first_name,
                        lname: auth.info.last_name,
                        nname: auth.info.nickname}
        # IO.inspect user_params

        changeset = User.changeset(%User{}, user_params)

        #signin(changeset)
    end

    defp signin(conn, changeset) do
        IO.put "ee"
    end

    defp insert_or_update_user(changeset) do#helper function (private) for authcontroller
        case Repo.get_by(User, email: changeset.changes.email) do#User is model, email is search criteria
            nil ->
                Repo.insert(changeset)
            user ->
                {:ok, user}
        end
    end

end