class RenameTestsStartedByUsersToTestPassages < ActiveRecord::Migration[6.0]
  def change
    rename_table :tests_started_by_users, :test_passages
  end
end
