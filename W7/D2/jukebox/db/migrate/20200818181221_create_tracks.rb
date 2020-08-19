class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.integer :band_id, null: false
      t.integer :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :is_bonus
    end
  end
end
