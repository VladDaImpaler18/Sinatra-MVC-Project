class OwnersController < ApplicationController

    get "/owners" do
        #display all pets
    end

    post "/owners" do
        params[:username].downcase! #standarizes usernames in database
        if !Owner.find_by(:username => params[:username])
            new_owner = Owner.new(params)
            if new_owner.save
                session[:user_id] = new_owner.id
                redirect "/owners/#{new_owner.id}"
            else
                erb :error #error
            end
        else
            erb :error #error
        end
            
    end

    get "/owners/new" do
        erb :'owners/new'
    end

    get "/owners/login" do
        erb :'owners/login'
    end

    get "/owners/:id" do
        current_user
        erb :'owners/show'
    end
end