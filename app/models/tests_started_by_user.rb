class TestsStartedByUser < ApplicationRecord
  belongs_to :test
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :test_id
end
