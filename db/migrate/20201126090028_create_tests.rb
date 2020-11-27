class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
