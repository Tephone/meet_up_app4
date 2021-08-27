class CreateMonthlyPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_plans do |t|
      t.string :name, null: false
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
    add_index :monthly_plans, %i[name ticket_id], unique: true
  end
end
