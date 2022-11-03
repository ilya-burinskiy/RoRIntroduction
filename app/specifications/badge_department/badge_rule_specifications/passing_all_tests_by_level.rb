module BadgeDepartment
  module BadgeRuleSpecifications
    class PassingAllTestsByLevel < AbstractRuleSpecification
      def satisfies?
        level = @rule_property
        return false if @test_passage.test.level != level

        @test_passage.user.passed_tests.where(level:).uniq.count == Test.where(level:).count
      end
    end
  end
end
