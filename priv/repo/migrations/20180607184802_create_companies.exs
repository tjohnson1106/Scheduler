defmodule Scheduler.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add(:name, :string)

      timestamps()
    end

    create table(:companies_users) do
      add(:company_id, references(:companies, on_delete: :nothing))
      add(:user_id, references(:users, on_delete: :nothing))
      add(:relationship, :string)
    end

    unique_index(:companies_users, [:company_id, :user_id], name: "companies_users_index")

    alter table(:schedulings) do
      add(:company_id, references(:companies, on_delete: :nothing))
    end
  end
end
