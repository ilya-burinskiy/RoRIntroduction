class RenameQuestionColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column(:questions, :title, :body)
  end
end
