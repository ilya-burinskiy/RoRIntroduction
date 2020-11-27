class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question_txt, null: false
      t.references :test, null: false

      t.timestamps
    end
  end
end
