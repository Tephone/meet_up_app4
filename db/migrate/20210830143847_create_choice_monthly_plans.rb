class CreateChoiceMonthlyPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :choice_monthly_plans do |t|
      t.references :student, null: false, foreign_key: true, index: false
      t.references :monthly_plan, null: false, foreign_key: true

      t.timestamps
    end
    add_index :choice_monthly_plans, %i[student_id monthly_plan_id], unique: true
  end
end
