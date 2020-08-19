class AlbumsController < ApplicationController
    def create
        @album = Album.new(album_params)
        if @album.save
            
        else
        end
    end
end