use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :timesheet, TimesheetWeb.Endpoint,
  secret_key_base: "3Ava1ed4dNR00oC7ZxBMa2IEpCVHr5E7fiW+0KagJn9o/dzBJKUcAGftN5Qfzma5"

# Configure your database
config :timesheet, Timesheet.Repo,
  username: "postgres",
  password: "postgres",
  database: "timesheet_prod",
  pool_size: 15
