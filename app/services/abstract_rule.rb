class AbstractRule
  def initialize(test_passage, rule_property)
    @test_passage = test_passage
    @rule_property = rule_property
  end
  
  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end
