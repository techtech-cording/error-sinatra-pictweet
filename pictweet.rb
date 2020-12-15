require 'rubygems'
require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "tweets.sqlite3"}

class Tweet < ActiveRecord::Base
end

get "/" do
  @tweets = Tweet.all
  erb :index
end

get "/tweet/new" do
  erb :new
end

post "/tweets" do
  Tweet.create(params)
  redirect '/'
end

get "/tweets/:id/edit" do
  @tweet = Tweet.find(params[:id])
  erb :edit
end

patch "/tweets/:id" do
  tweet = Tweet.find(params[:id])
  tweet.update(text: params[:text], image: params[:image])
  redirect "/"
end

get "/tweets/:id/delete" do
  @tweet = Tweet.find(params[:id])
  erb :delete
end

delete "/tweets/:id" do
  tweet = Tweet.find(params[:id])
  tweet.delete
  redirect "/"
end