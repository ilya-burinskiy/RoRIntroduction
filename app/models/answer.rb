class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :validate_add_to_question
  scope :correct, -> { where(correct: true) }

  private

  def validate_add_to_question
    unless (0..3).include?(question.answers.count)
      errors.add(:base, message: "Too many answers for question #{question.title}")
    end
  end
end
