
require 'rspec/core/rake_task'
require 'data_mapper'

namespace :db do
desc "auto_updgrade using datamapper"
task :auto_upgrade do
   DataMapper.auto_upgrade!
   puts 'upgraded using datamapper'
 end

desc "auto_migrate using datamapper"
task :auto_migrate do
   DataMapper.auto_migrate!
   puts ' migrated using datamapper'
 end
end
