module TestPassagesHelper
  def test_passage_color
    @test_passage.passed? ? "green" : "red"
  end

  def test_passage_message
    test_title = @test_passage.test.title
    return "The #{test_title} Test was Passed" if @test_passage.passed?
    "The #{test_title} Test was not Passed"
  end
end
