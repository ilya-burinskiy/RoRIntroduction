class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :started_tests, through: :test_passages, source: :test
  has_many :created_tests, class_name: "Test", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, uniqueness: true, presence: true,
  #                   format: { with: URI::MailTo::EMAIL_REGEXP,
  #                             message: 'Invalid email format' }
                              
  def started_tests_by_level(level)
    started_tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
