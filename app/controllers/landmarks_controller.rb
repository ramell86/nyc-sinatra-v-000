class LandmarksController < ApplicationController

    get '/landmarks' do 
        @landmark = Landmark.all
    
        erb :'/landmarks/new'
    end
end
