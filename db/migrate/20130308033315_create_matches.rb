class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :red_alliance_id
      t.integer :blue_alliance_id
      t.text :notes

      t.timestamps
    end
  end
end
