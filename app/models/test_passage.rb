# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :question_id, optional: true

  def completed?
    current_question.nil? || !time_left?
  end

  def time_left
    return test.time if created_at == updated_at

    (created_at + test.time - Time.now).to_i
  end

  def time_left?
    time_left > 0
  end
end
