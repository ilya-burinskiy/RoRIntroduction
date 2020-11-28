class Test < ApplicationRecord
  def self.by_category(pattern)
    tests_categories = Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
    tests_categories.where('categories.name LIKE :pattern', pattern: "%#{pattern}%").order('tests.title DESC')
  end
end
