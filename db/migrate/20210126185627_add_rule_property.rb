class AddRuleProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule_property, :integer
    change_column_null :badges, :rule_property, false
  end
end
