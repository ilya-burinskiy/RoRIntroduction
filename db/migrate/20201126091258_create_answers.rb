class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
      t.text :answer_text, null: false
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
