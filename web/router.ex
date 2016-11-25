defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
    # get "/topics/new", TopicController, :new
    # post "/topics", TopicController, :create
    # get "/topics", TopicController, :index
    # get "/topics/:id/edit", TopicController, :edit
    # put "/topics/:id/edit", TopicController, :update
    #???del "/topics/:id/edit", TopicController, :delete
    resources "/topics/", TopicController#automates all above
    resources "/", PageController
  end

  scope "/auth", Discuss do
    pipe_through :browser

    get "/:provider", AuthController, :request#Ueberauth stuff, could be "/github" etc manually
    get "/:provider/callback", AuthController, :callback
    post "/identity/callback", AuthController, :identity_callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
