class Comment < ApplicationRecord
  validates :body, presence: true, length:{minimum:3}
  belongs_to :user, class_name: "User", :foreign_key=>:user_id
  belongs_to :post, class_name: "Post", :foreign_key=>:post_id
end
