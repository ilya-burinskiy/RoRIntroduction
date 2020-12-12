module TestPassagesHelper
  def test_passage_color
    return "green" if passed?
    "red"
  end

  def test_passage_message
    test_title = @test_passage.test.title
    return "The #{test_title} Test was Passed" if passed?
    "The #{test_title} Test was not Passed"
  end

  private

  def passed?
    return true if @test_passage.passage_percent >= TestPassage::THRESHOLD
    false
  end
end
