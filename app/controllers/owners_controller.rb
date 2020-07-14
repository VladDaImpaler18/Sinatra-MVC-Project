class OwnersController < ApplicationController

    get "/owners" do
        #display all pets of user. If the user is the animal shelter, we can add pets, and assign them
        
    end

    post "/owners/signup" do
        standardize_inputs
        if !owner #user doesn't exist
            new_owner = Owner.new(params)
            if new_owner.save #all necessary 
                session[:user_id] = new_owner.id
                redirect "/owners/index"
            else
                erb :error #error when 
            end 
        end
    end

    get "/owners/new" do
        erb :'owners/new'
    end

    get "/owners/login" do
        erb :'owners/login'
    end

    post "/owners/login" do
        standardize_inputs
        owner = Owner.find_by(:username => params[:username])
        if owner #owner exists
            if owner && owner.authenticate(params[:password]) #valid user and correct password
                session[:user_id] = owner.id
                redirect "/owners/index"
            else 
                erb :error #invalid password
            end
        else
            erb :error #user not found
        end
    end
 

end