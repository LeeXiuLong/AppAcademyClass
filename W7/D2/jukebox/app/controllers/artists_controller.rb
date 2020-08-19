class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
        render :index
    end

    def new
        @artist = Artist.new
        render :new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to artist_url(@artist.id)
        else
            flash.now[:errors] = ["This is an invalid artist name."]
            render :new
        end
    end

    def edit
        @artist = Artist.find(params[:id])
        render :edit
    end

    def update
        @artist = Artist.find(params[:id])
        if @artist.update(artist_params)
            redirect_to artist_url(@artist.id)
        else
            flash.now[:errors] = ["This is an invalid update."]
            render :edit
        end
    end

    def show
        @artist = Artist.find(params[:id])
        render :show
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        redirect_to artists_url
    end

    private 

    def artist_params
        params.require(:artist).permit(:name)
    end
end