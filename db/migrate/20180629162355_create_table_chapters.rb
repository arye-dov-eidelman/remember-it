class CreateTableChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :track_id
      t.string :title
      t.integer :sort_key

      t.timestamps null: false
    end
  end
end
