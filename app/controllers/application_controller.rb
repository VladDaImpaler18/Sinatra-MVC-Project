require './config/environment'

class ApplicationController < Sinatra::Base


  configure do
    #set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Cherryberry Llama n Ferry"
  end


  get "/" do
    if Owner.all.size==0
      cli = AdminCreator.new
      cli.run
    end
    erb :index
  end


  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Owner.find_by_id(session[:user_id]) if session[:user_id]
    end

    def current_pet
      @current_pet ||= Pet.find_by_id(session[:pet_id]) if session[:pet_id]
    end

    def current_picture
      @current_picture ||= Picture.find_by_id(session[:picture_id]) if session[:picture_id]
    end

    def animal_shelter?
      animal_shelter = Owner.find_by_id(1) && Owner.find_by(:username => ENV["ADMIN_USERNAME"]) #prevents wrong first ID mishaps
      @current_user==animal_shelter ? true : false
    end
    
    def standardize_inputs
      words = ENV["WORDS"].to_i
      characters = ENV["LETTERS"].to_i
      params[:username].downcase! if !params[:username].nil? && params[:username] != ENV["ADMIN_USERNAME"] #standarizes usernames in database
      params[:phone] = params[:phone].to_phone if !params[:phone].nil? #standarizes phone number in database
      params[:filename] = "#{RandomWordGenerator.composed(num_of_words, num_of_characters, '-')}_#{params[:filename].gsub("_"," ")}" if !params[:filename].nil? #SEED DATA replaces underscores with spaces to avoid complications
      params[:file][:filename] = "#{RandomWordGenerator.composed(words, characters, '-')}_#{params[:file][:filename].gsub("_"," ")}" if defined? params[:file][:filename] #Actual picture upload
    end

    def pet_owner?
      current_user.pets.include?(current_pet)
    end


  end
  
end
