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

  before do
    @links = Link.all
    @tags = Tag.all
  end

  get '/links/new' do
    erb :new_bookmark
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tags].split(",")
    tags.each do |tag_name|
      tag = Tag.create(name: tag_name)
      link.tags << tag
      link.save
      redirect '/links'
    end
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  run! if app_file == $0
end
