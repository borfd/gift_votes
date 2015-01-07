class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.string :person
      t.date :day

      t.timestamps
    end
  end
end
