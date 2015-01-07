class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :birthday_id
      t.integer :user_id
      t.float :amount

      t.timestamps
    end
  end
end
