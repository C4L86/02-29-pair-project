require 'rake/testtask'

require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require "./main"
  end
end

Rake::TestTask.new(:test) do |t|
  t.libs = %w(lib tests)
  t.pattern = 'tests/**/*_test.rb'
end

task :default => :test

task :pre_populate_games do
  require "./main"
  populate_game_table
end

task :fetch_titles do
  require "./main"
  fetch_titles_from_spielbound
end