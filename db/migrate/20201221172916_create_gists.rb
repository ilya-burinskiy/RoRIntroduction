class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true, null: false
      t.string :url, null: false
      t.string :hash_from_url, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
