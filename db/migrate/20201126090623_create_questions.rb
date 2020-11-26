class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question_txt
      t.integer :test

      t.timestamps
    end
  end
end
