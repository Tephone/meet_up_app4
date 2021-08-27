class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :fee, null: false
      t.integer :lesson_count, null: false

      t.timestamps
    end
  end
end
