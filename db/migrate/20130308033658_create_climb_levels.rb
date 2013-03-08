class CreateClimbLevels < ActiveRecord::Migration
  def change
    create_table :climb_levels do |t|
      t.integer :height
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end
end
