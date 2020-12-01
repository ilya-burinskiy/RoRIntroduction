class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validate :validate_answer_count, on: :create

  private

  def validate_answer_count
    errors.add(:answer_count) if answers.count < 1 || answers.count > 4
  end
end
