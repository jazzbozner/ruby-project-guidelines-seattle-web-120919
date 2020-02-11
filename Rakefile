require_relative "config/environment"
require "sinatra/activerecord/rake"

desc "starts a console"
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  [:seed]
  Pry.start
end
