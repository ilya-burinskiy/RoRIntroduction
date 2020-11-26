class AddAnswersIsCorrectNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :is_correct, false)
  end
end
