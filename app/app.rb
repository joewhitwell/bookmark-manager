ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link.rb'


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
    Link.create(url: params[:url], title: params[:title])
    Tag.create(params[:tag])
    redirect '/links'
  end
  
  run! if app_file == $0
end
