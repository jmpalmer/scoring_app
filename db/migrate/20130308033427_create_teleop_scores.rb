class CreateTeleopScores < ActiveRecord::Migration
  def change
    create_table :teleop_scores do |t|
      t.integer :high
      t.integer :medium
      t.integer :low
      t.integer :pyramid
      t.integer :match_id
      t.integer :alliance_id

      t.timestamps
    end
  end
end
