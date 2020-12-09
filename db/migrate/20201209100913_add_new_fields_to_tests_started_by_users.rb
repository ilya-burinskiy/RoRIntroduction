class AddNewFieldsToTestsStartedByUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :tests_started_by_users, :correct_questions, :integer
    add_reference :tests_started_by_users, :question, foreign_key: true

    change_column_null :tests_started_by_users, :correct_questions, false
    change_column_default :tests_started_by_users, :correct_questions, from: nil, to: 0 

    change_column_null :tests_started_by_users, :question_id, false
  end
end
