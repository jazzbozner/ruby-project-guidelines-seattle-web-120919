require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "db/safe_vault.db")
require_all "lib"
