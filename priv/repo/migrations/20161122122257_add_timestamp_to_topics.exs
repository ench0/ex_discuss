defmodule Discuss.Repo.Migrations.AddTimestampToTopics do
  use Ecto.Migration

  def change do
    alter table(:topics) do
      add :inserted_at, :datetime, default: fragment("NOW()")
      add :updated_at, :datetime, default: fragment("NOW()")
      #timestamps()
    end
  end
end
