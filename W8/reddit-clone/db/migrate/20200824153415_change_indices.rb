class ChangeIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :subs, :title, unique: true
  end
end
