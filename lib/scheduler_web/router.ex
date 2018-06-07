defmodule SchedulerWeb.Router do
  use SchedulerWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", SchedulerWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController)
    resources("/shifts", ShiftController)
    resources("/schedulings", SchedulingController)
  end

  # Other scopes may use custom stacks.
  # scope "/api", SchedulerWeb do
  #   pipe_through :api
  # end
end
