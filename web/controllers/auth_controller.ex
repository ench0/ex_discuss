defmodule Discuss.AuthController do
    use Discuss.Web, :controller
    plug Ueberauth

    alias Discuss.User#so we can use User.xxx

    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do#callback function is related to Ueberauth, nothing to do with Phoenix
        # IO.puts "*****"
        # IO.inspect(conn.assigns)
        # IO.puts "*****"
        # IO.inspect(params)
        # IO.puts "*****"
        # IO.inspect(auth)
        user_params = %{token: auth.credentials.token,
                        email: auth.info.email,
                        provider: auth.provider,
                        uname: auth.info.nickname}
        # IO.inspect user_params

        changeset = User.changeset(%User{}, user_params)
    end
end