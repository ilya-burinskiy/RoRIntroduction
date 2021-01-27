class BadgeService
  RULES = {
    passing_test_on_first_try: PassingTestOnFirstTry,
    passing_all_tests_from_category: PassingAllTestsFromCategory,
    passing_all_tests_by_level: PassingAllTestsByLevel
  }.freeze

  def self.call(test_passage)
    new(test_passage).call
  end

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    if @test_passage.passed?
      Badge.find_each do |badge|
        rule = RULES[badge.rule.to_sym].new(@test_passage, badge.rule_property)
        add_badge(badge) if rule.satisfies?
      end
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges.push(badge)
  end

end
