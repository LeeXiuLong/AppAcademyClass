class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :created_at, :datetime, null: false
    add_column :artists, :updated_at, :datetime, null: false
    add_column :tracks, :created_at, :datetime, null: false
    add_column :tracks, :updated_at, :datetime, null: false
    add_column :albums, :created_at, :datetime, null: false
    add_column :albums, :updated_at, :datetime, null: false
  end
end
