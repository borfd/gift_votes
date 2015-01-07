class CreateGiftIdeas < ActiveRecord::Migration
  def change
    create_table :gift_ideas do |t|
      t.string :link
      t.integer :added_by_id
      t.integer :birthday_id

      t.timestamps
    end
  end
end
