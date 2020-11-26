class AddTestsCategoryNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :category, false)
  end
end
