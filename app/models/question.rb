class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, uniqueness: { scope: :test }, presence: true

  def number
    tot_questions_count = test.questions.count
    Hash[test.question_ids.zip(1..tot_questions_count)][id]
  end
end
