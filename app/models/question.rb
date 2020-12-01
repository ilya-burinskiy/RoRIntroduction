class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validate :validate_answer_count, if: :should_validate?

  private

  def validate_answer_count
    unless (1..4).include?(answers.count)
      errors.add(:base, message: 'Question can have from 1 to 4 answers') 
    end
  end

  def should_validate?
    return false if Answer.count.zero?
    true
  end
end
