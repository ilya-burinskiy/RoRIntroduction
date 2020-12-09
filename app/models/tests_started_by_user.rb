class TestsStartedByUser < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id'
end
