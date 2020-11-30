class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_started_by_users, dependent: :destroy
  has_many :passing_users, through: :tests_started_by_users, source: :user
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  def self.list_titles_by_category(pattern)
    Test.joins(
      'JOIN categories ON tests.category_id = categories.id'
    ).where(categories: { name: pattern }).order(title: :desc).pluck(:title)
  end
end
