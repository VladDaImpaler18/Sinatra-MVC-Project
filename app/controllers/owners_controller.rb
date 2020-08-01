class OwnersController < ApplicationController

    get "/owners" do
        #If the user is the animal shelter, we can add pets, and assign them
        if logged_in?
            @owners = Owner.all if animal_shelter?
            erb :'owners/admin'
        else
            redirect "/owners/login"
        end
    end

    get "/owners/new" do
        erb :'owners/new'
    end

    post "/owners/new" do
        standardize_inputs
        owner = Owner.find_by(:username => params[:username])
        if !owner #user doesn't exist
            new_owner = Owner.new(params)
            if new_owner.save #all necessary 
                session[:user_id] = new_owner.id
                current_user
                redirect "/owners/#{current_user.id}"
            else
                erb :'owners/new'
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
                redirect :'/owners' if animal_shelter?
                redirect :"/owners/#{current_user.id}"
            else 
                @error_message = "Invalid Username/Password Combination"
                erb :'owners/login' #invalid password
            end
        else
            erb :error #user not found
        end
    end

    delete '/owners/:id' do 
        @owner = Owner.find_by_id(params[:id])
        @owner.delete
        redirect to "/owners" if animal_shelter?
        redirect to "/owners/logout"
    end

    get "/owners/logout" do 
        session.clear
        redirect "/"
    end

    get "/owners/:id" do 
       #need to get individual id maybe do radio buttons for params?
       if logged_in?
        redirect "/owners" if animal_shelter?
        erb :'/owners/show'
       else
        redirect '/owners/login'
       end
    end

    post "/owners/admin" do
        @owner = Owner.find_by_id(params[:owner])
        erb :'/owners/edit'
    end
    
    patch "/owners/:id" do
        #current_user
        if !animal_shelter?
            if !params[:old_password].empty? && current_user.authenticate(params[:old_password]) #update password
                if params[:new_password]==params[:new_password2] && !params[:new_password].empty?
                    current_user.password= params[:new_password] 
                else
                    @error_message = "New password and confirmation do not match"
                    erb :'/owners/edit'
                end
            else
                @error_message = "Invalid Password"
                @owner=Owner.find_by_id(params[:id])
                erb :'/owners/edit'
            end
            standardize_inputs
            params.each do |k,v|
                next if k=="old_password" || k=="new_password" || k=="new_password2" ||k=="_method" || k=="id"
                current_user[k]=v unless v.empty?
            end
            current_user.save(validate: false)
        
            redirect to "/owners/#{current_user.id}"
        else #if coming from admin portal
            @owner = Owner.find_by_id(params[:id])
            standardize_inputs
            params.each do |k,v|
                next if k=="old_password" || k=="new_password" ||k=="_method" || k=="id"
                @owner[k]=v unless v.empty?
            end
            @owner.save(validate: false)
        
            redirect to "/owners"
        end
    end

    get "/owners/:id/edit" do
        if !logged_in?
            @error_message = "You must be logged in to view this content"
            erb :error
        end
        @owner=Owner.find_by_id(params[:id])
        erb :'/owners/edit'
    end

end