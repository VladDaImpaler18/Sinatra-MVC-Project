class PetsController < ApplicationController

    get "/pets" do
        @pets = Pet.all
        erb :index
    end
end