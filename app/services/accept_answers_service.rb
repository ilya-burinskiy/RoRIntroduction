class AcceptAnswersService
  def initialize(test_passage, user_answers)
    @test_passage = test_passage
    @user_answers = user_answers
  end

  def call
    @test_passage.correct_questions += 1 if answer_correct?
    @test_passage.current_question = next_question
    @test_passage.save
    progress_percent
  end

  private

  def answer_correct?
    @test_passage.current_question.answers.correct == @user_answers
  end

  # TODO: Use Arel
  def next_question
    @test_passage.test.questions.where(Arel.sql("`questions`.`id` > #{@test_passage.current_question.id}")).first
  end

  def progress_percent
    return 100 if @test_passage.current_question.nil?

    ((question_number(@test_passage.current_question) - 1) / @test_passage.test.questions.count.to_f * 100).to_i
  end

  def question_number(question)
    enumerated_questions = Hash[@test_passage.test.question_ids.zip(1..@test_passage.test.questions.count)]
    enumerated_questions[question.id]
  end
end
