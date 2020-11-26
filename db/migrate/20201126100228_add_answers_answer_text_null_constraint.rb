class AddAnswersAnswerTextNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :answer_text, false)
  end
end
