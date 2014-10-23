class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id, null: false
      t.integer :user_id, null: false
      
      t.timestamps
    end
    add_index :response, :answer_choice_id
    add_index :response, :user_id
    add_index :response, [:user_id, :answer_choice_id], unique: true
  end
end
