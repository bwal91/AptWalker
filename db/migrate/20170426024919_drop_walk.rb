class DropWalk < ActiveRecord::Migration[5.0]
  def change
  	drop_table :walk_scores
  end
end
