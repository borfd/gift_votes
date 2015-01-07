class AddPriceToGiftIdeas < ActiveRecord::Migration
  def change
    add_column :gift_ideas, :price, :float
  end
end
