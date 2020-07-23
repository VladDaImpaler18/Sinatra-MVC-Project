class PicturesController < ApplicationController

    get "/pictures" do #Will list all available pets (owner.nil?)
        @pictures = Picture.all
        erb :'/pictures/index'
    end

    get "/picture/new" do
        current_pet
        erb :'pictures/new'
    end
    
    
    get "/pictures/:id" do
        
    end

    get "/pictures/:id/edit" do

    end

    
end