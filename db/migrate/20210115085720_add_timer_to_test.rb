class AddTimerToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time, :integer, default: 15
  end
end
