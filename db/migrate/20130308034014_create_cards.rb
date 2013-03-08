class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :color
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end
end
