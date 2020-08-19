class ChangeTracks < ActiveRecord::Migration[5.2]
  def change
    add_index :tracks, :band_id
    add_index :tracks, :album_id
  end
end
