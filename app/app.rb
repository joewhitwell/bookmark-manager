ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require_relative 'models/link'
# require_relative 'models/tag'
require './app/data_mapper_setup.rb'


class BookmarkManager < Sinatra::Base
  
  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end
  
  get '/links/new' do
    erb :new_bookmark
  end
  
  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end
  
  run! if app_file == $0
end
