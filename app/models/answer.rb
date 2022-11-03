class Answer < ApplicationRecord
  belongs_to :question

  validates :body, uniqueness: { scope: :question }, presence: true
  validate :validate_max_answers_count_for_question, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_count_for_question
    return if (0..3).include?(question.answers.count)

    errors.add(:base, message: "Too many answers for question #{question.body}")
  end
end
