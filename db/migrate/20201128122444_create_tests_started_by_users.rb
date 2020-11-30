class CreateTestsStartedByUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_started_by_users do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
