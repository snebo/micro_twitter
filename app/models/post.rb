class Post < ApplicationRecord
  validates :title, presence: true, length:{minimum:10}
  validates :body, presence: true
end
