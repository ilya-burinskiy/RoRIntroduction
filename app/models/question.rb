class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, uniqueness: { scope: :test }, presence: true
end
