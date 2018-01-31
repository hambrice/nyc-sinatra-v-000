require 'pry'
class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])

    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |title|
        @figure.titles << Title.find(title)
      end
    end
      if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |landmark|
        @figure.landmarks << Landmark.find(landmark)
      end
    end
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"]) if !params["landmark"]["name"].empty?
  @figure.titles << Title.create(name: params["title"]["name"]) if !params["title"]["name"].empty?
  @figure.save
  erb :'figures/index'
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.update(name: params["figure"]["name"])

    if params["figure"]["title_ids"] != nil
      params["figure"]["title_ids"].each do |title|
        @figure.titles << Title.find(title)
      end
    end
      if params["figure"]["landmark_ids"] != nil
      params["figure"]["landmark_ids"].each do |landmark|
        @figure.landmarks << Landmark.find(landmark)
      end
    end
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"]) if !params["landmark"]["name"].empty?
  @figure.titles << Title.create(name: params["title"]["name"]) if !params["title"]["name"].empty?
  @figure.save
  redirect "figures/#{@figure.id}"
end
end
