module BadgeDepartment
  module BadgeRuleSpecifications
    class PassingTestOnFirstTry < AbstractRuleSpecification
      def satisfies?
        test = Test.find(@rule_property)
        return false if @test_passage.test != test

        TestPassage.where(test: test, user: @test_passage.user).count == 1
      end
    end
  end
end
