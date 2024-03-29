class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :passing_users, through: :test_passages, source: :user
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 },
                    presence: true,
                    uniqueness: { scope: :title }
  validates :time, numericality: { only_integer: true }

  scope :by_level, ->(level) { where(level:) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :difficult, -> { by_level(5..Float::INFINITY) }

  def self.list_titles_by_category(pattern)
    Test.joins(:category).where(
      categories: { name: pattern }
    ).order(title: :desc).pluck(:title)
  end

  def self.all_levels
    pluck(:level).uniq
  end
end
