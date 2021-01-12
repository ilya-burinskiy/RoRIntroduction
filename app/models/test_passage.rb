class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :question_id, optional: true

  before_validation :before_validation_set_first_question, on: :create

  THRESHOLD = 85.freeze

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def passage_percent
    calc_passage_percent if @passage_percent.nil?
    @passage_percent
  end

  def progress_percent
    calc_progress_percent if @progress_percent.nil?
    @progress_percent
  end

  def passed?
    true if passage_percent >= THRESHOLD
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def calc_passage_percent
    total_correct_questions_num = 0
    test.questions.each do |question|
      total_correct_questions_num += question.answers.correct.count
    end
    @passage_percent = (correct_questions.to_f / total_correct_questions_num * 100).to_i
  end

  def calc_progress_percent
    @progress_percent = ((current_question.number - 1) / test.questions.count.to_f * 100).to_i
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id  > ?', current_question.id).first
  end
end
