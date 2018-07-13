class CreateTableQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :chapter_id
      t.string :title
      t.integer :sort_key

      t.timestamps null: false
    end
  end
end
