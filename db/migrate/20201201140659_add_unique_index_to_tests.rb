class AddUniqueIndexToTests < ActiveRecord::Migration[6.0]
  def change
    add_index(:tests, [:level, :title], unique: true)
  end
end
