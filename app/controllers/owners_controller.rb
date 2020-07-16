class OwnersController < ApplicationController

    get "/owners" do
        #display all pets of user. If the user is the animal shelter, we can add pets, and assign them
        if logged_in?
            @owners = Owner.all if animal_shelter? #TODO: limit exposure by checking for admin 
            current_user
            erb :'owners/index'
        else
            redirect "/owners/login"
        end
    end

    post "/owners" do

    end

    get "/owners/new" do
        erb :'owners/new'
    end

    post "/owners/signup" do
        standardize_inputs
        owner = Owner.find_by(:username => params[:username])
        if !owner #user doesn't exist
            new_owner = Owner.new(params)
            if new_owner.save #all necessary 
                session[:user_id] = new_owner.id
                current_user
                redirect :'/owners'
            else
                erb :error #error when 
            end 
        end
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
                current_user
                redirect :'/owners'
            else 
                erb :error #invalid password
            end
        else
            erb :error #user not found
        end
    end

    get "/owners/logout" do 
        session.clear
        redirect "/"
    end

    get "/owners/:id" do 
       #need to get individual id maybe do radio buttons for params?
       if logged_in?
        binding.pry 
        erb :'/owners/show'
       else
        redirect '/owners'
       end
    end

    get "/owners/:id/edit" do
        @owner = Owner.find_by_id(session[:user_id])
        erb :'/owners/edit'
    end
 

end