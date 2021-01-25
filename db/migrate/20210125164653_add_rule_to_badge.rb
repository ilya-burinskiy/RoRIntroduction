class AddRuleToBadge < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule, :string
    change_column_null :badges, :rule, false
    add_index :badges, :rule, unique: true
  end
end
