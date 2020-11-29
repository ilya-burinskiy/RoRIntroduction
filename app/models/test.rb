class Test < ApplicationRecord
  def self.by_category(pattern)
    Test.joins(
      'INNER JOIN categories ON tests.category_id = categories.id'
    ).where(categories: {name: pattern}).order(title: :desc)
  end
end
