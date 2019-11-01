# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheet.Repo.insert!(%Timesheet.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Timesheet.Repo
alias Timesheet.Users.User
alias Timesheet.Manager.Managers
alias Timesheet.Jobs.Job

pw = Argon2.hash_pwd_salt("password1234")

Repo.insert!(%Managers{name: "Alice Anderson", email: "alice@acme.com", password_hash: pw})
Repo.insert!(%Managers{name: "Bob Anderson", email: "bob@acme.com", password_hash: pw})

Repo.insert!(%User{name: "Carol Anderson", email: "carol@acme.com", password_hash: pw, manager_id: 1})
Repo.insert!(%User{name: "Dave Anderson", email: "dave@acme.com", password_hash: pw, manager_id: 2})

Repo.insert!(%Job{job_code: "VAOR-01", budget: 20, name: "Cyborg Arm", description: "Lorem Ipsum", manager_id: 1})
Repo.insert!(%Job{job_code: "VAOR-02", budget: 45, name: "Sobriety Pill", description: "Lorem Ipsum", manager_id: 1})
Repo.insert!(%Job{job_code: "VAOR-03", budget: 12, name: "Rat Cancer", description: "Lorem Ipsum", manager_id: 2})

