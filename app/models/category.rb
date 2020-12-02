class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  default_scope { order(:name) }
end
