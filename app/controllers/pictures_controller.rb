class PicturesController < ApplicationController

    get "/pictures" do #Will list all available pets 
        @pictures = []
        Picture.all.each do |picture|
            @pictures << picture if picture.pets.first.nil? || picture.pets.first.available_for_adoption? 
        end
        erb :'/pictures/index'
    end

    get "/pictures/new" do
        current_pet
        erb :'/pictures/new'
    end
    
    post "/pictures/new" do
        standardize_inputs
        filename = params[:file][:filename]
        file = params[:file][:tempfile]
        File.open("./public/images/pets/#{filename}", 'wb') do |f|
          f.write(file.read)
        end
        new_picture = Picture.new(:title => params[:title], :filename => filename, :caption => params[:caption], :description => params[:description])
        new_picture.pets << current_pet
        if new_picture.save
            session[:picture_id] = new_picture.id
            redirect "/pictures/#{current_picture.id}"
        else
            current_pet
            erb :'/pictures/new'
        end
    end
    
    delete "/pictures/:id" do
        picture = Picture.find_by_id(params[:id])
        File.delete("./public/#{picture.get_picture_path}") if File.exist?("./public/#{picture.get_picture_path}")
        pet = picture.pets.first
        pet.profile = nil if pet.profile == picture.id
        pet.save if pet.profile.nil?
        picture.delete
        session.delete(:picture_id)

        redirect to "/pets/#{current_pet.id}"
    end

    patch "/pictures/:id" do
        params.each do |k,v|
            next if k=="_method" || k=="id"
            current_picture[k]=v unless v.empty?
        end
        current_picture.save
        
        redirect to "/pictures/#{current_picture.id}"
    end

    get "/pictures/:id" do
        session[:picture_id] = params[:id] if logged_in?
        if pet_owner? || animal_shelter? || current_pet.available_for_adoption?
            current_picture
            erb :'/pictures/show'
        else
            @error_message = "You can only view pictures of your pet(s)" if !pet_owner?
            @error_message = "You must login to view this content" if !logged_in?
            erb :error
        end 
    end

    get "/pictures/:id/edit" do
        if logged_in?
            if pet_owner? || animal_shelter?
                erb :'/pictures/edit'
            else
                @error_message = "This isn't your pet, you cannot view this picture"
                erb :error
            end
        else
            @error_message = "You lack authorization to view this page"
            erb :error
        end
    end

    
end