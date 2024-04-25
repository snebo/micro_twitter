class Post < ApplicationRecord
  validates :title, presence: true, length:{minimum:10}
  validates :body, presence: true

  belongs_to :user, class_name:"User", :foreign_key=>:user_id
  has_many :comments, class_name:"Comment", :foreign_key=> :post_id
end
