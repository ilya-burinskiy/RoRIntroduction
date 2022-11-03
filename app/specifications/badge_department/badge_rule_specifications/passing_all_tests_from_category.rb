module BadgeDepartment
  module BadgeRuleSpecifications
    class PassingAllTestsFromCategory < AbstractRuleSpecification
      def satisfies?
        category = Category.find(@rule_property)
        return false if @test_passage.test.category != category

        @test_passage.user.passed_tests.where(category:).count % Test.where(category:).count == 0
      end
    end
  end
end
