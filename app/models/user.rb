class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :started_tests, through: :test_passages, source: :test
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :first_name, presence: true
  validates :last_name, presence: true

  def started_tests_by_level(level)
    started_tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def passed_tests
    Test.joins(:test_passages).where(test_passages: { user: self, passed: true })
  end
end
