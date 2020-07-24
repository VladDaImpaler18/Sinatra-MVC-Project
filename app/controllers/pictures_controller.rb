class PicturesController < ApplicationController

    get "/pictures" do #Will list all available pets (owner.nil?)
        @pictures = Picture.all
        erb :'/pictures/index'
    end

    get "/pictures/new" do
        current_pet
        erb :'/pictures/new'
    end
    
    post "/pictures/new" do
        binding.pry
    end

    post "/pictures/upload" do
        binding.pry
    end
    
    get "/pictures/:id" do
        
    end

    get "/pictures/:id/edit" do

    end

    
end