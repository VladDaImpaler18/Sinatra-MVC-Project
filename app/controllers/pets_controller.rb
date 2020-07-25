class PetsController < ApplicationController

    get "/pets" do
        @pets = Pet.all
        erb :'/pets/index'
    end

    post "/pets" do
        if params[:revoke]
            current_user.pets.delete(current_pet)
            if current_user.save(validate: false)
               session.delete(:pet_id)
               redirect "/owners/#{current_user.id}"
            else
                @error_message = "Error revoking pet"
                erb :error
            end
        end
        if params[:adopt]
            current_user.pets << current_pet
            if current_user.save(validate: false)
                redirect "/owners/#{current_user.id}"
            else
                @error_message = "Error adopting pet"
                erb :error
            end
        end
        
    end

    get "/pets/new" do
        @owners = Owner.all
        erb :'pets/new'
    end

    post "/pets/new" do
        new_pet = Pet.new(:name => params[:name], :breed => params[:breed], :owner_id => params[:owner])
        if new_pet.save
            session[:pet_id] = new_pet.id
            redirect "/pets/#{current_pet.id}"
        else
            erb :'/pets/new'
        end
    end

    get "/pets/:id" do
        if logged_in? 
            session[:pet_id] = params[:id]
            if pet_owner? || animal_shelter?
                current_pet
                erb :'/pets/show'
            elsif current_pet.available_for_adoption?
                current_pet
                erb :'/pets/show'
            else
                @error_message = "This isn't your pet, you cannot view this page"
                erb :error
            end
        else
            @error_message = "You lack authorization to view this page"
            erb :error
        end
    end

    patch "/pets/:id" do
        params.each do |k,v|
            next if k=="_method" || k=="id"
            current_pet[k]=v unless v.empty?
        end
        current_pet.save
        
        redirect to "/pets/#{current_pet.id}"
    end

    delete "/pets/:id" do
        @pet = Pet.find_by_id(params[:id])
        @pet.pictures.each do |picture|
            File.delete("./public/#{picture.get_picture_path}") if File.exist?("./public/#{picture.get_picture_path}")
            picture.delete
        end
        @pet.delete
        session.delete(:pet_id)
        session.delete(:picture_id)
        redirect to "/owners/#{current_user.id}"
    end

    get "/pets/:id/edit" do 
        if logged_in?
            if pet_owner? || animal_shelter?
                erb :'/pets/edit'
            else
                @error_message = "This isn't your pet, you cannot edit the pet's information"
                erb :error
            end
        else
            @error_message = "You lack authorization to view this page"
            erb :error
        end
    end

end