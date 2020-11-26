class SetAnswersIsCorrectDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :is_correct, false)
  end
end
