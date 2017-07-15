class LandmarksController < ApplicationController

    get '/landmarks' do 
        @landmarks = Landmark.all
    
        erb :'/landmarks/index'
    end

    get '/landmarks/new' do 
        @landmarks = Landmark.all
         erb :'landmarks/new'  
    end

    get '/landmarks/:id' do
        @landmarks = Landmark.find_by_id(params[:id])

        erb :'landmarks/show'
    end
    
    post '/landmarks' do
        @landmarks = Landmark.create(params[:landmark])
     
        redirect to "/landmarks/:id"
    end

    get '/landmarks/:id/edit' do
        @landmarks = Landmark.find_by_id(params[:id])
        erb :"landmarks/edit"
        end

    post '/landmarks/:id' do
        @landmarks = Landmark.find_by_id(params[:id])
        @landmarks.update(params[:landmark])

        redirect to "/landmarks/#{@landmarks.id}"
    end



end
