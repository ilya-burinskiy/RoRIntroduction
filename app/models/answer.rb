class Answer < ApplicationRecord
  belongs_to :question
  validates :body, uniqueness: { scope: :question }, presence: true
  validate :validate_add_to_question, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_add_to_question
    unless (0..3).include?(question.answers.count)
      errors.add(:base, message: "Too many answers for question #{question.title}")
    end
  end
end
