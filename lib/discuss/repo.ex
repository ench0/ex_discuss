defmodule Discuss.Repo do
  use Ecto.Repo, otp_app: :discuss
  use Scrivener, page_size: 5
end
