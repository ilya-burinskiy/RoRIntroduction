class Test < ApplicationRecord
  belongs_to :category
  has_many :tests_started_by_users
  has_many :users, through: :tests_started_by_users

  def self.list_titles_by_category(pattern)
    Test.joins(
      'JOIN categories ON tests.category_id = categories.id'
    ).where(categories: { name: pattern }).order(title: :desc).pluck(:title)
  end
end
