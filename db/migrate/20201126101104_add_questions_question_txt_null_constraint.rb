class AddQuestionsQuestionTxtNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :question_txt, false)
  end
end
