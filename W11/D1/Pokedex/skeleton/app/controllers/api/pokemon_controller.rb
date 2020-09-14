class Api::PokemonController < ApplicationController

    def index
        @pokemons = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        @items = Item.where(pokemon_id: params[:id])
        render :show
    end
end