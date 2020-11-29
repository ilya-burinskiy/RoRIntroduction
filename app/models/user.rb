class User < ApplicationRecord
  def started_tests_by_level(level)
    Test.joins(
      'INNER JOIN tests_started_by_users ON tests_started_by_users.test_id = tests.id'
    ).where(level: level)
  end
end
