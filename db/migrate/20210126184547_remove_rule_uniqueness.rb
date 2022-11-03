class RemoveRuleUniqueness < ActiveRecord::Migration[6.0]
  def change
    remove_index :badges, name: 'index_badges_on_rule'
  end
end
