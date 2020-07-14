class PicturesController < ApplicationController

    get "/pictures" do
        @pictures = Picture.all
        erb :'/pictures/index'
    end
end