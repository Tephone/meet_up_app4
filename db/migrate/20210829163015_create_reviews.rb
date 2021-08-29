class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.references :teacher, null: false, foreign_key: true, index: false
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, %i[teacher_id lesson_id], unique: true
  end
end
