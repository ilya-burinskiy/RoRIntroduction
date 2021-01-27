class AddBadgeNameUniqueness < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, :name, unique: true
  end
end
