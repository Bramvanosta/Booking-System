# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rails db:kill_postgres_connections"

namespace :db do
  desc 'Kill Postgres Connections'
  task kill_postgres_connections: :environment do

    ActiveRecord::Base.connection.select_all "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where datname='booking-system_development' AND state='idle';"
    ActiveRecord::Base.connection.select_all "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where datname='booking-system_staging' AND state='idle';"

  end
end