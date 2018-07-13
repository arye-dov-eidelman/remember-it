class CreateTableQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :quiz_id
      t.string :title
      t.string :type
      t.integer :sort_key

      t.timestamps null: false
    end
  end
end
