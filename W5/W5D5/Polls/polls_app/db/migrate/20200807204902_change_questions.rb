class ChangeQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :poll_id, :integer
  end
end
