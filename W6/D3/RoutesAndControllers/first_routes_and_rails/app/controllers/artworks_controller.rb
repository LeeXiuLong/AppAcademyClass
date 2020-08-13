class ArtworksController < ApplicationController
    def index
        if params[:user_id]
        # index of nested resource
            # current_user = User.find(params[:user_id])
            # @artworks = current_user.artworks
            # @artworks_shared = current_user.viewed_artworks
            @artworks = Artwork.joins(:shares)
            .where("artworks.artist_id = #{params[:user_id]} OR artwork_shares.viewer_id = #{params[:user_id]}")
        else
            @artworks = Artwork.all
        end

        render json: @artworks

    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork
    end
    
    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status:422
        end
    end

    private
    def artwork_params
        params
            .require(:artwork)
            .permit(:title, :image_url, :artist_id)
    end
end