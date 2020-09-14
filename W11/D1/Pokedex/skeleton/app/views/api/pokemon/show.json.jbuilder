json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url

    json.moves do
        json.array! @pokemon.moves
    end

    json.item_ids do
        json.array! @pokemon.item_ids
    end 
end

json.items do
    @pokemon.items.each do |item|
        json.set! item.id do
            json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
        end
    end
end