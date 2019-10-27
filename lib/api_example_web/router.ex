defmodule ApiExampleWeb.Router do
  use ApiExampleWeb, :router

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

  scope "/", ApiExampleWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/v1", ApiExampleWeb do
    pipe_through :api
    get "/users", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApiExampleWeb do
  #   pipe_through :api
  # end
end