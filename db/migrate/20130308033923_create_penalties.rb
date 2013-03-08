class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.integer :tech_foul
      t.integer :foul
      t.integer :match_id
      t.integer :alliance_id

      t.timestamps
    end
  end
end
