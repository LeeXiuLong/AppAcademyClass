class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.timestamps

      t.index ["email"], name: "index_users_on_email"
    end
  end
end
