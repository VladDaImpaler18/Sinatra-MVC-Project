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
      animal_shelter = Owner.find_by_id(1) && Owner.find_by(:username => "Animal Shelter") #prevents wrong first ID mishaps
      @current_user==animal_shelter ? true : false
    end
    
    def standardize_inputs
      number_of_words = 2 #must match @@GLOBALS in picture class
      number_of_characters = 20
      params[:username].downcase! if !params[:username].nil? && params[:username] != "Animal Shelter" #standarizes usernames in database
      params[:phone] = params[:phone].to_phone if !params[:phone].nil? #standarizes phone number in database
      params[:filename] = "#{RandomWordGenerator.composed(2, 20, '-')}_#{params[:filename].gsub("_"," ")}" if !params[:filename].nil? #replaces underscores with spaces to avoid complications
    end

    def pet_owner?
      @current_pet ||= Pet.find_by_id(params[:id]) if params[:id]
      current_user.pets.include(@current_pet)
    end


  end
  
end
