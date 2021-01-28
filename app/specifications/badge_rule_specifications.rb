module BadgeRuleSpecifications
  class PassingAllTestsByLevel < AbstractRule
    def satisfies?
      level = @rule_property
      return false if @test_passage.test.level != level

      @test_passage.user.passed_tests.where(level: level).uniq.count == Test.where(level: level).count
    end
  end

  class PassingAllTestsFromCategory < AbstractRule
    def satisfies?
      category = Category.find(@rule_property)
      return false if @test_passage.test.category != category

      @test_passage.user.passed_tests.where(category: category).count % Test.where(category: category).count == 0
    end
  end

  class PassingTestOnFirstTry < AbstractRule
    def satisfies?
      test = Test.find(@rule_property)
      return false if @test_passage.test != test

      TestPassage.where(test: test, user: @test_passage.user).count == 1
    end
  end
end
