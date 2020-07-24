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
        @filename = params[:file][:filename]
        file = params[:file][:tempfile]
      
        File.open("./public/#{@filename}", 'wb') do |f|
          f.write(file.read)
        end
    end
    
    get "/pictures/:id" do
        
    end

    get "/pictures/:id/edit" do

    end

    
end