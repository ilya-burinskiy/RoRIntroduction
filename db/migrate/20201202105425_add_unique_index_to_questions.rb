class AddUniqueIndexToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_index(:questions, [:body, :test_id], unique: true)
  end
end
