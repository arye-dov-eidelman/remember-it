class CreateTableTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :owner_id
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
