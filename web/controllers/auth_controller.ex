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

        # insert_or_update_user(changeset)
        signin(conn, changeset)
    end

    defp signin(conn, changeset) do
        case insert_or_update_user(changeset) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "Welcome back!")
                |> put_session(:user_id, user.id)
                |> redirect(to: topic_path(conn, :index))
            {:error, reason} ->
                IO.puts "+++===+++"
                IO.inspect reason
                IO.puts "+++===+++"
                conn
                |> put_flash(:info, "Error signing in")
                |> redirect(to: topic_path(conn, :index))
        end
    end

    defp insert_or_update_user(changeset) do#helper function (private) for authcontroller
        case Repo.get_by(User, uname: changeset.changes.uname) do#User is model, email is search criteria
            nil ->
                Repo.insert(changeset)
            user ->
                {:ok, user}
        end
    end




    # def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    #     case validate_password(auth.credentials) do
    #         :ok ->
    #         user = %{id: auth.uid, name: name_from_auth(auth), avatar: auth.info.image}
    #         conn
    #         |> put_flash(:info, "Successfully authenticated.")
    #         |> put_session(:current_user, user)
    #         |> redirect(to: "/")
    #         { :error, reason } ->
    #         conn
    #         |> put_flash(:error, reason)
    #         |> redirect(to: "/")
    #     end
    # end



end