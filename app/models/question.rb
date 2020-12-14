class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, uniqueness: { scope: :test }, presence: true

  def number
    Hash[test.question_ids.zip(1..test.questions.count)][id]
  end
end
