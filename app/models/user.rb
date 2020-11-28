class User < ApplicationRecord
  def tests_by_level(level)
    tests_ids = TestsStartedByUser.where(user_id: id).pluck(:test_id)
    Test.where(id: tests_ids).where(level: level)
  end
end
