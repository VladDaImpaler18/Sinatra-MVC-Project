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

    def animal_shelter?
      animal_shelter = Owner.find_by_id(1) && Owner.find_by(:username => "animal shelter") #prevents wrong first ID mishaps
      @current_user==animal_shelter ? true : false
    end
    
    def standardize_inputs
      params[:username].downcase! if !params[:username].nil? #standarizes usernames in database
      params[:phone] = params[:phone].to_phone if !params[:phone].nil? #standarizes phone number in database
      params[:filename] = "#{RandomWordGenerator.composed(2, 20, '-')}_#{params[:filename]}" if !params[:filename].nil?
    end

  end
  
end
