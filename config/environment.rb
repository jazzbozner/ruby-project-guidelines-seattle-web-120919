require "bundler"

Bundler.require
require_all "lib"

ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/not_so_safe_vault.db",
)
