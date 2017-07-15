class FiguresController < ApplicationController
    
    get '/figures' do
        @figures = Figure.all
        erb :'figures/index'
        
    end

    get '/figures/new' do 
        @figures = Figure.all
        @landmarks = Landmark.all
        @titles = Title.all
         erb :'figures/new'  
    end

    get '/figures/:id' do
        @figures = Figure.find_by_id(params[:id])

        erb :'figures/show'
    end
    
    post '/figures' do
        @figure = Figure.create(params[:figure])
        if !params[:title][:name].empty?
            @title = Title.create(params[:title])
            @figure.titles << @title
         end
        if !params[:landmark][:name].empty?
         @landmark = Landmark.create(params[:landmark])
            @figure.landmarks << @landmark
            end
        redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id/edit' do
        @figures = Figure.find_by_id(params[:id])
        erb :"/figures/edit"
    end

    post '/figures/:id' do
        @figures = Figure.find_by_id(params[:id])
        @figures.update(params[:figure])
        @figures.landmarks.update(params[:landmark])

        redirect to "/figures/#{@figures.id}"
    end
end