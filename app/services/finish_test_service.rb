class FinishTestService
  PASSAGE_THRESHOLD = 85

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    @test_passage.update(passed: passage_percent >= PASSAGE_THRESHOLD)
    TestsMailer.completed_test(@test_passage).deliver_later
    BadgeDepartment::BadgeService.call(@test_passage)
    passage_percent
  end

  private

  def passage_percent
    @passage_percent ||= calculate_passage_percent
  end

  def calculate_passage_percent
    total_correct_questions_number = 0
    @test_passage.test.questions.each do |question|
      total_correct_questions_number += question.answers.correct.count
    end
    (@test_passage.correct_questions.to_f / total_correct_questions_number * 100).to_i
  end
end
