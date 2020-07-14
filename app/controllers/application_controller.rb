require './config/environment'

class ApplicationController < Sinatra::Base


  configure do
    #set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Cherryberry Llama n Ferry"
  end


  get "/" do
    erb :index
  end


  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Owner.find_by(id: session[:user_id]) if session[:user_id]
    end

    def is_animal_shelter?
      animal_shelter = Owner.find_by_id(1) && Owner.find_by(:username => "animal shelter")
      @current_user==animal_shelter ? true : false
    end
    
    def standardize_inputs
      params[:username].downcase! #standarizes usernames in database
        if !params[:phone].nil? #checks to see if signing up to account
            params[:phone] = params[:phone].to_phone #standarizes phone number in database
        end
    end

  end
  
end
