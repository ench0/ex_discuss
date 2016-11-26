defmodule Discuss.Plugs.RequireAuth do

import Plug.Conn
import Phoenix.Controller

alias Discuss.Router.Helpers

    def init(_params) do #it is required, even though that we don't use it
    end

    def call(conn, _params) do
        if conn.assigns[:user] do
            conn
        else
            conn
            |> put_flash(:alert, "You must log in")
            |> redirect(to: Helpers.topic_path(conn, :index)) #Helpers so we don't import all other functions
            |> halt #to tell that there is no response
        end
    end
end