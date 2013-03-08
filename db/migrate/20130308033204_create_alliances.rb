class CreateAlliances < ActiveRecord::Migration
  def change
    create_table :alliances do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :team3_id

      t.timestamps
    end
  end
end
