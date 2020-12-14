class AddNewFieldsToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :correct_questions, :integer
    add_reference :test_passages, :question, foreign_key: true
    
    change_column_default :test_passages, :correct_questions, from: nil, to: 0 
  end
end
