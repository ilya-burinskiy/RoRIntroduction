class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def hash
    URI.parse(url).path.delete('/')
  end
end
