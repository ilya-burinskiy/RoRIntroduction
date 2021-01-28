class ChangeBadgeRuleType < ActiveRecord::Migration[6.0]
  def change
    change_column :badges, :rule, :integer
  end
end
