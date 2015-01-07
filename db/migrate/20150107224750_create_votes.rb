class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :birthday_id
      t.integer :gift_idea_id
      t.integer :user_id

      t.timestamps
    end
  end
end
