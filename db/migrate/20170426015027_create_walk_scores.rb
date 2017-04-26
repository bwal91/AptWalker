class CreateWalkScores < ActiveRecord::Migration[5.0]
  def change
    create_table :walk_scores do |t|
      t.float :score
      t.string :description
      t.float :transit_score
      t.string :transit_summary
      t.references :apartment

      t.timestamps
    end
  end
end
