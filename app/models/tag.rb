require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  has n, :links, :through => :taggings
  
  include DataMapper::Resource
  
  property :id, Serial
  property :tag, String
  
  
  
end

DataMapper.setup(:default,   ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
