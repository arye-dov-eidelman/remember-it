class CreateTableUserTrackProgress < ActiveRecord::Migration
  def change
    create_table :User_track_progress do |t|
      t.integer :user_id
      t.integer :track_id
      t.integer :last_comleted_chapter_id
      t.integer :last_comleted_quiz_id

      t.timestamps null: false
    end
  end
end
