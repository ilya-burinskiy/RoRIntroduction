class AddUniqueIndexToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_index(:answers, [:body, :question_id], unique: true)
  end
end
