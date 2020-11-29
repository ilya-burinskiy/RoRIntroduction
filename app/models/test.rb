class Test < ApplicationRecord
  def self.by_category(pattern)
    Test.joins(
      'JOIN categories ON tests.category_id = categories.id'
    ).where(categories: {name: pattern}).order(title: :desc).pluck(:title)
  end
end
