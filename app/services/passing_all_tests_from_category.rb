class PassingAllTestsFromCategory < AbstractRule
  def satisfies?
    category = Category.find(@rule_property)
    return false if @test_passage.test.category != category

    @test_passage.user.passed_tests.where(category: category).count % Test.where(category: category).count == 0
  end
end
