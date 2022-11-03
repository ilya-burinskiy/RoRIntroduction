class AddUniqueIndexToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_index(:questions, %i[body test_id], unique: true)
  end
end
