require 'pry'
class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(name:params["landmark"]["name"], year_completed:params["landmark"]["year_completed"].to_s)
    redirect :'/landmarks'
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"].to_s)
    redirect "/landmarks/#{@landmark.id}"
  end
end
