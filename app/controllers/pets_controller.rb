class PetsController < ApplicationController

    get "/pets" do
        @pets = Pet.all
        erb :'pets/index'
    end


    get "/pets/:id" do
        if logged_in?
            if current_user.pets.find_by_id(params[:id]) || animal_shelter?
                @pet = Pet.find_by_id(params[:id])
                erb :'/pets/show'
            end
        else
            @error_message = "You lack authorization to view this page"
            erb :error
        end
    end
end